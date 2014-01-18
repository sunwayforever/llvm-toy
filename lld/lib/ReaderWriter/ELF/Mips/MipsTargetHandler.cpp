//===- lib/ReaderWriter/ELF/Mips/MipsTargetHandler.cpp --------------------===//
//
//                             The LLVM Linker
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "File.h"
#include "MipsLinkingContext.h"
#include "MipsTargetHandler.h"

using namespace lld;
using namespace elf;

namespace {

class MipsDynamicSymbolTable : public DynamicSymbolTable<Mips32ElELFType> {
public:
  MipsDynamicSymbolTable(const MipsLinkingContext &context)
      : DynamicSymbolTable<Mips32ElELFType>(
            context, ".dynsym",
            DefaultLayout<Mips32ElELFType>::ORDER_DYNAMIC_SYMBOLS),
        _layout(context.getTargetLayout()) {}

  virtual void sortSymbols() {
    std::stable_sort(_symbolTable.begin(), _symbolTable.end(),
                     [this](const SymbolEntry &A, const SymbolEntry &B) {
      if (A._symbol.getBinding() != STB_GLOBAL &&
          B._symbol.getBinding() != STB_GLOBAL)
        return A._symbol.getBinding() < B._symbol.getBinding();

      return _layout.getGOTSection().compare(A._atom, B._atom);
    });
  }

private:
  const MipsTargetLayout<Mips32ElELFType> &_layout;
};

class MipsDynamicTable : public DynamicTable<Mips32ElELFType> {
public:
  MipsDynamicTable(MipsLinkingContext &context)
      : DynamicTable<Mips32ElELFType>(
            context, ".dynamic", DefaultLayout<Mips32ElELFType>::ORDER_DYNAMIC),
        _layout(context.getTargetLayout()) {}

  virtual void createDefaultEntries() {
    DynamicTable<Mips32ElELFType>::createDefaultEntries();

    Elf_Dyn dyn;

    // Version id for the Runtime Linker Interface.
    dyn.d_un.d_val = 1;
    dyn.d_tag = DT_MIPS_RLD_VERSION;
    addEntry(dyn);

    // MIPS flags.
    dyn.d_un.d_val = RHF_NOTPOT;
    dyn.d_tag = DT_MIPS_FLAGS;
    addEntry(dyn);

    // The base address of the segment.
    dyn.d_un.d_ptr = 0;
    dyn.d_tag = DT_MIPS_BASE_ADDRESS;
    _dt_baseaddr = addEntry(dyn);

    // Number of local global offset table entries.
    dyn.d_un.d_val = 0;
    dyn.d_tag = DT_MIPS_LOCAL_GOTNO;
    _dt_localgot = addEntry(dyn);

    // Number of entries in the .dynsym section.
    dyn.d_un.d_val = 0;
    dyn.d_tag = DT_MIPS_SYMTABNO;
    _dt_symtabno = addEntry(dyn);

    // The index of the first dynamic symbol table entry that corresponds
    // to an entry in the global offset table.
    dyn.d_un.d_val = 0;
    dyn.d_tag = DT_MIPS_GOTSYM;
    _dt_gotsym = addEntry(dyn);

    // Address of the .got section.
    dyn.d_un.d_val = 0;
    dyn.d_tag = DT_PLTGOT;
    _dt_pltgot = addEntry(dyn);
  }

  virtual void updateDynamicTable() {
    DynamicTable<Mips32ElELFType>::updateDynamicTable();

    // Assign the minimum segment address to the DT_MIPS_BASE_ADDRESS tag.
    auto baseAddr = std::numeric_limits<uint64_t>::max();
    for (auto si : _layout.segments())
      if (si->segmentType() != llvm::ELF::PT_NULL)
        baseAddr = std::min(baseAddr, si->virtualAddr());
    _entries[_dt_baseaddr].d_un.d_val = baseAddr;

    auto &got = _layout.getGOTSection();

    _entries[_dt_symtabno].d_un.d_val = getSymbolTable()->size();
    _entries[_dt_gotsym].d_un.d_val =
        getSymbolTable()->size() - got.getGlobalCount();
    _entries[_dt_localgot].d_un.d_val = got.getLocalCount();
    _entries[_dt_pltgot].d_un.d_ptr =
        _layout.findOutputSection(".got")->virtualAddr();
  }

private:
  MipsTargetLayout<Mips32ElELFType> &_layout;

  std::size_t _dt_symtabno;
  std::size_t _dt_localgot;
  std::size_t _dt_gotsym;
  std::size_t _dt_pltgot;
  std::size_t _dt_baseaddr;
};
}

MipsTargetHandler::MipsTargetHandler(MipsLinkingContext &context)
    : DefaultTargetHandler(context), _targetLayout(context),
      _relocationHandler(context, *this), _gpDispSymAtom(nullptr) {}

uint64_t MipsTargetHandler::getGPDispSymAddr() const {
  return _gpDispSymAtom ? _gpDispSymAtom->_virtualAddr : 0;
}

bool MipsTargetHandler::doesOverrideELFHeader() { return true; }

void MipsTargetHandler::setELFHeader(ELFHeader<Mips32ElELFType> *elfHeader) {
  elfHeader->e_version(1);

  elfHeader->e_ident(llvm::ELF::EI_VERSION, llvm::ELF::EV_CURRENT);
  elfHeader->e_ident(llvm::ELF::EI_OSABI, llvm::ELF::ELFOSABI_NONE);
  if (_targetLayout.findOutputSection(".got.plt"))
    elfHeader->e_ident(llvm::ELF::EI_ABIVERSION, 1);
  else
    elfHeader->e_ident(llvm::ELF::EI_ABIVERSION, 0);

  // FIXME (simon): Read elf flags from all inputs, check compatibility,
  // merge them and write result here.
  uint32_t flags = llvm::ELF::EF_MIPS_NOREORDER | llvm::ELF::EF_MIPS_ABI_O32 |
                   llvm::ELF::EF_MIPS_CPIC | llvm::ELF::EF_MIPS_ARCH_32R2;
  if (_context.getOutputELFType() == llvm::ELF::ET_DYN)
    flags |= EF_MIPS_PIC;
  elfHeader->e_flags(flags);
}

MipsTargetLayout<Mips32ElELFType> &MipsTargetHandler::targetLayout() {
  return _targetLayout;
}

const MipsTargetRelocationHandler &
MipsTargetHandler::getRelocationHandler() const {
  return _relocationHandler;
}

LLD_UNIQUE_BUMP_PTR(DynamicTable<Mips32ElELFType>)
MipsTargetHandler::createDynamicTable() {
  return LLD_UNIQUE_BUMP_PTR(DynamicTable<Mips32ElELFType>)(
      new (_alloc) MipsDynamicTable(
          static_cast<MipsLinkingContext &>(_context)));
}

LLD_UNIQUE_BUMP_PTR(DynamicSymbolTable<Mips32ElELFType>)
MipsTargetHandler::createDynamicSymbolTable() {
  return LLD_UNIQUE_BUMP_PTR(DynamicSymbolTable<Mips32ElELFType>)(
      new (_alloc) MipsDynamicSymbolTable(
          static_cast<MipsLinkingContext &>(_context)));
}

bool MipsTargetHandler::createImplicitFiles(
    std::vector<std::unique_ptr<File>> &result) {
  typedef CRuntimeFile<Mips32ElELFType> RFile;
  auto file = std::unique_ptr<RFile>(new RFile(_context, "MIPS runtime file"));

  if (_context.isDynamic()) {
    file->addAbsoluteAtom("_GLOBAL_OFFSET_TABLE_");
    file->addAbsoluteAtom("_gp");
    file->addAbsoluteAtom("_gp_disp");
  }
  result.push_back(std::move(file));
  return true;
}

void MipsTargetHandler::finalizeSymbolValues() {
  DefaultTargetHandler<Mips32ElELFType>::finalizeSymbolValues();

  if (_context.isDynamic()) {
    auto gotSection = _targetLayout.findOutputSection(".got");
    auto got = gotSection ? gotSection->virtualAddr() : 0;
    auto gp = gotSection ? got + _targetLayout.getGPOffset() : 0;

    auto gotAtomIter = _targetLayout.findAbsoluteAtom("_GLOBAL_OFFSET_TABLE_");
    assert(gotAtomIter != _targetLayout.absoluteAtoms().end());
    (*gotAtomIter)->_virtualAddr = got;

    auto gpAtomIter = _targetLayout.findAbsoluteAtom("_gp");
    assert(gpAtomIter != _targetLayout.absoluteAtoms().end());
    (*gpAtomIter)->_virtualAddr = gp;

    auto gpDispAtomIter = _targetLayout.findAbsoluteAtom("_gp_disp");
    assert(gpDispAtomIter != _targetLayout.absoluteAtoms().end());
    _gpDispSymAtom = (*gpDispAtomIter);
    _gpDispSymAtom->_virtualAddr = gp;
  }
}

void MipsTargetHandler::registerRelocationNames(Registry &registry) {
  registry.addKindTable(Reference::KindNamespace::ELF,
                        Reference::KindArch::Mips, kindStrings);
}

const Registry::KindStrings MipsTargetHandler::kindStrings[] = {
  LLD_KIND_STRING_ENTRY(R_MIPS_NONE),
  LLD_KIND_STRING_ENTRY(R_MIPS_32),
  LLD_KIND_STRING_ENTRY(R_MIPS_26),
  LLD_KIND_STRING_ENTRY(R_MIPS_HI16),
  LLD_KIND_STRING_ENTRY(R_MIPS_LO16),
  LLD_KIND_STRING_ENTRY(R_MIPS_GOT16),
  LLD_KIND_STRING_ENTRY(R_MIPS_CALL16),
  LLD_KIND_STRING_ENTRY(R_MIPS_JALR),
  LLD_KIND_STRING_ENTRY(R_MIPS_JUMP_SLOT),
  LLD_KIND_STRING_ENTRY(LLD_R_MIPS_GLOBAL_GOT),
  LLD_KIND_STRING_ENTRY(LLD_R_MIPS_GLOBAL_GOT16),
  LLD_KIND_STRING_ENTRY(LLD_R_MIPS_GLOBAL_26),
  LLD_KIND_STRING_ENTRY(LLD_R_MIPS_HI16),
  LLD_KIND_STRING_ENTRY(LLD_R_MIPS_LO16),
  LLD_KIND_STRING_END
};
