; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32IFD %s

define i32 @fcmp_false(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_false:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi a0, zero, 0
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp false double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_oeq(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_oeq:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    feq.d a0, ft1, ft0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp oeq double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ogt(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ogt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fld ft1, 0(sp)
; RV32IFD-NEXT:    flt.d a0, ft1, ft0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ogt double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_oge(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_oge:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fld ft1, 0(sp)
; RV32IFD-NEXT:    fle.d a0, ft1, ft0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp oge double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_olt(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_olt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    flt.d a0, ft1, ft0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp olt double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ole(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ole:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fle.d a0, ft1, ft0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ole double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_one(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_one:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    feq.d a0, ft0, ft0
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    feq.d a1, ft1, ft1
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    feq.d a1, ft1, ft0
; RV32IFD-NEXT:    xori a1, a1, -1
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp one double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ord(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ord:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    feq.d a0, ft0, ft0
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    feq.d a1, ft0, ft0
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ord double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ueq(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ueq:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    feq.d a0, ft1, ft0
; RV32IFD-NEXT:    feq.d a1, ft0, ft0
; RV32IFD-NEXT:    feq.d a2, ft1, ft1
; RV32IFD-NEXT:    and a1, a2, a1
; RV32IFD-NEXT:    sltiu a1, a1, 1
; RV32IFD-NEXT:    or a0, a0, a1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ueq double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ugt(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ugt:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fld ft1, 0(sp)
; RV32IFD-NEXT:    flt.d a0, ft1, ft0
; RV32IFD-NEXT:    feq.d a1, ft1, ft1
; RV32IFD-NEXT:    feq.d a2, ft0, ft0
; RV32IFD-NEXT:    and a1, a2, a1
; RV32IFD-NEXT:    sltiu a1, a1, 1
; RV32IFD-NEXT:    or a0, a0, a1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ugt double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_uge(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_uge:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fld ft1, 0(sp)
; RV32IFD-NEXT:    fle.d a0, ft1, ft0
; RV32IFD-NEXT:    feq.d a1, ft1, ft1
; RV32IFD-NEXT:    feq.d a2, ft0, ft0
; RV32IFD-NEXT:    and a1, a2, a1
; RV32IFD-NEXT:    sltiu a1, a1, 1
; RV32IFD-NEXT:    or a0, a0, a1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp uge double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ult(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ult:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    flt.d a0, ft1, ft0
; RV32IFD-NEXT:    feq.d a1, ft0, ft0
; RV32IFD-NEXT:    feq.d a2, ft1, ft1
; RV32IFD-NEXT:    and a1, a2, a1
; RV32IFD-NEXT:    sltiu a1, a1, 1
; RV32IFD-NEXT:    or a0, a0, a1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ult double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_ule(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_ule:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fle.d a0, ft1, ft0
; RV32IFD-NEXT:    feq.d a1, ft0, ft0
; RV32IFD-NEXT:    feq.d a2, ft1, ft1
; RV32IFD-NEXT:    and a1, a2, a1
; RV32IFD-NEXT:    sltiu a1, a1, 1
; RV32IFD-NEXT:    or a0, a0, a1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp ule double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_une(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_une:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    feq.d a0, ft0, ft0
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    feq.d a1, ft1, ft1
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    feq.d a1, ft1, ft0
; RV32IFD-NEXT:    xori a1, a1, 1
; RV32IFD-NEXT:    sltiu a0, a0, 1
; RV32IFD-NEXT:    or a0, a1, a0
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp une double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_uno(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_uno:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a3, 4(sp)
; RV32IFD-NEXT:    sw a2, 0(sp)
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 0(sp)
; RV32IFD-NEXT:    feq.d a0, ft0, ft0
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    feq.d a1, ft0, ft0
; RV32IFD-NEXT:    and a0, a1, a0
; RV32IFD-NEXT:    sltiu a0, a0, 1
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp uno double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fcmp_true(double %a, double %b) nounwind {
; RV32IFD-LABEL: fcmp_true:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi a0, zero, 1
; RV32IFD-NEXT:    jalr zero, ra, 0
  %1 = fcmp true double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}
