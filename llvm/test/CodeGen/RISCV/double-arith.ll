; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32IFD %s

define double @fadd_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fadd_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fadd.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = fadd double %a, %b
  ret double %1
}

define double @fsub_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fsub_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fsub.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = fsub double %a, %b
  ret double %1
}

define double @fmul_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fmul_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fmul.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = fmul double %a, %b
  ret double %1
}

define double @fdiv_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fdiv_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fdiv.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = fdiv double %a, %b
  ret double %1
}

declare double @llvm.sqrt.f32(double)

define double @fsqrt_d(double %a) nounwind {
; RV32IFD-LABEL: fsqrt_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -16
; RV32IFD-NEXT:    sw a1, 12(sp)
; RV32IFD-NEXT:    sw a0, 8(sp)
; RV32IFD-NEXT:    fld ft0, 8(sp)
; RV32IFD-NEXT:    fsqrt.d ft0, ft0
; RV32IFD-NEXT:    fsd ft0, 0(sp)
; RV32IFD-NEXT:    lw a0, 0(sp)
; RV32IFD-NEXT:    lw a1, 4(sp)
; RV32IFD-NEXT:    addi sp, sp, 16
; RV32IFD-NEXT:    ret
  %1 = call double @llvm.sqrt.f32(double %a)
  ret double %1
}

declare double @llvm.copysign.f32(double, double)

define double @fsgnj_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fsgnj_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fsgnj.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = call double @llvm.copysign.f32(double %a, double %b)
  ret double %1
}

define double @fneg_d(double %a) nounwind {
; TODO: doesn't test the fneg selection pattern because
; DAGCombiner::visitBITCAST will generate a xor on the incoming integer
; argument
; RV32IFD-LABEL: fneg_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    lui a2, 524288
; RV32IFD-NEXT:    mv a2, a2
; RV32IFD-NEXT:    xor a1, a1, a2
; RV32IFD-NEXT:    ret
  %1 = fsub double -0.0, %a
  ret double %1
}

define double @fsgnjn_d(double %a, double %b) nounwind {
; TODO: fsgnjn.s isn't selected because DAGCombiner::visitBITCAST will convert
; (bitconvert (fneg x)) to a xor
; RV32IFD-LABEL: fsgnjn_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    lui a0, 524288
; RV32IFD-NEXT:    mv a0, a0
; RV32IFD-NEXT:    xor a0, a3, a0
; RV32IFD-NEXT:    sw a0, 20(sp)
; RV32IFD-NEXT:    fld ft0, 24(sp)
; RV32IFD-NEXT:    fld ft1, 16(sp)
; RV32IFD-NEXT:    fsgnj.d ft0, ft0, ft1
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = fsub double -0.0, %b
  %2 = call double @llvm.copysign.f32(double %a, double %1)
  ret double %2
}

declare double @llvm.fabs.f32(double)

define double @fabs_d(double %a) nounwind {
; TODO: doesn't test the fabs selection pattern because
; DAGCombiner::visitBITCAST will generate an and on the incoming integer
; argument
; RV32IFD-LABEL: fabs_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    lui a2, 524288
; RV32IFD-NEXT:    addi a2, a2, -1
; RV32IFD-NEXT:    and a1, a1, a2
; RV32IFD-NEXT:    ret
  %1 = call double @llvm.fabs.f32(double %a)
  ret double %1
}

; TODO: implement a test for fsgnjx
;define double @fsgnjx_d(double %a, double %b) nounwind {
;}

declare double @llvm.minnum.f32(double, double)

define double @fmin_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fmin_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fmin.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = call double @llvm.minnum.f32(double %a, double %b)
  ret double %1
}

declare double @llvm.maxnum.f32(double, double)

define double @fmax_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fmax_d:
; RV32IFD:       # %bb.0:
; RV32IFD-NEXT:    addi sp, sp, -32
; RV32IFD-NEXT:    sw a3, 20(sp)
; RV32IFD-NEXT:    sw a2, 16(sp)
; RV32IFD-NEXT:    sw a1, 28(sp)
; RV32IFD-NEXT:    sw a0, 24(sp)
; RV32IFD-NEXT:    fld ft0, 16(sp)
; RV32IFD-NEXT:    fld ft1, 24(sp)
; RV32IFD-NEXT:    fmax.d ft0, ft1, ft0
; RV32IFD-NEXT:    fsd ft0, 8(sp)
; RV32IFD-NEXT:    lw a0, 8(sp)
; RV32IFD-NEXT:    lw a1, 12(sp)
; RV32IFD-NEXT:    addi sp, sp, 32
; RV32IFD-NEXT:    ret
  %1 = call double @llvm.maxnum.f32(double %a, double %b)
  ret double %1
}

define i32 @feq_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: feq_d:
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
; RV32IFD-NEXT:    ret
  %1 = fcmp oeq double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @flt_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: flt_d:
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
; RV32IFD-NEXT:    ret
  %1 = fcmp olt double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fle_d(double %a, double %b) nounwind {
; RV32IFD-LABEL: fle_d:
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
; RV32IFD-NEXT:    ret
  %1 = fcmp ole double %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}
