// 2023-05-22 17:01
#include "ToyAsmPrinter.h"
#include "llvm/MC/TargetRegistry.h"

using namespace llvm;

extern Target TheToyTarget;

extern "C" void LLVMInitializeToyAsmPrinter() {
  RegisterAsmPrinter<ToyAsmPrinter> X(TheToyTarget);
}

#include "ToyGenMCPseudoLowering.inc"
void ToyAsmPrinter::emitInstruction(const MachineInstr *MI) {
  if (emitPseudoExpansionLowering(*OutStreamer, MI))
    return;

  MachineBasicBlock::const_instr_iterator I = MI->getIterator();
  MachineBasicBlock::const_instr_iterator E = MI->getParent()->instr_end();

  do {
    MCInst TmpInst0;
    MCInstLowering.Lower(&*I, TmpInst0);
    OutStreamer->emitInstruction(TmpInst0, getSubtargetInfo());
  } while (++I != E && I->isInsideBundle());
}
