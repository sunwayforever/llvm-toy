; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32IFD %s

define double @double_imm() nounwind {
; RV32IFD-LABEL: double_imm:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    lui a0, 345155
; RV32IFD-NEXT:    addi a0, a0, -744
; RV32IFD-NEXT:    lui a1, 262290
; RV32IFD-NEXT:    addi a1, a1, 507
; RV32IFD-NEXT:    ret
  ret double 3.1415926535897931159979634685441851615905761718750
}

define double @double_imm_op(double %a) nounwind {
; RV32IFD-LABEL: double_imm_op:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    lui a0, %hi(.LCPI1_0)
; RV32IFD-NEXT:    addi a0, a0, %lo(.LCPI1_0)
; RV32IFD-NEXT:    fld ft0, 0(a0)
; RV32IFD-NEXT:    fld ft1, 8(sp)
; RV32IFD-NEXT:    fadd.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 0(sp)
; RV32IFD-NEXT:    lw a0, 0(sp)
; RV32IFD-NEXT:    lw a1, 4(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
  %1 = fadd double %a, 1.0
  ret double %1
}
