; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32I

define i32 @udiv(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: udiv:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a2, %hi(__udivsi3)
; RV32I-NEXT:    addi a2, a2, %lo(__udivsi3)
; RV32I-NEXT:    jalr ra, a2, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = udiv i32 %a, %b
  ret i32 %1
}

define i32 @udiv_constant(i32 %a) nounwind {
; RV32I-LABEL: udiv_constant:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a1, %hi(__udivsi3)
; RV32I-NEXT:    addi a2, a1, %lo(__udivsi3)
; RV32I-NEXT:    addi a1, zero, 5
; RV32I-NEXT:    jalr ra, a2, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = udiv i32 %a, 5
  ret i32 %1
}

define i32 @udiv_pow2(i32 %a) nounwind {
; RV32I-LABEL: udiv_pow2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    srli a0, a0, 3
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = udiv i32 %a, 8
  ret i32 %1
}

define i64 @udiv64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: udiv64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a4, %hi(__udivdi3)
; RV32I-NEXT:    addi a4, a4, %lo(__udivdi3)
; RV32I-NEXT:    jalr ra, a4, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = udiv i64 %a, %b
  ret i64 %1
}

define i64 @udiv64_constant(i64 %a) nounwind {
; RV32I-LABEL: udiv64_constant:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a2, %hi(__udivdi3)
; RV32I-NEXT:    addi a4, a2, %lo(__udivdi3)
; RV32I-NEXT:    addi a2, zero, 5
; RV32I-NEXT:    addi a3, zero, 0
; RV32I-NEXT:    jalr ra, a4, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = udiv i64 %a, 5
  ret i64 %1
}

define i32 @sdiv(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sdiv:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a2, %hi(__divsi3)
; RV32I-NEXT:    addi a2, a2, %lo(__divsi3)
; RV32I-NEXT:    jalr ra, a2, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = sdiv i32 %a, %b
  ret i32 %1
}

define i32 @sdiv_constant(i32 %a) nounwind {
; RV32I-LABEL: sdiv_constant:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a1, %hi(__divsi3)
; RV32I-NEXT:    addi a2, a1, %lo(__divsi3)
; RV32I-NEXT:    addi a1, zero, 5
; RV32I-NEXT:    jalr ra, a2, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = sdiv i32 %a, 5
  ret i32 %1
}

define i32 @sdiv_pow2(i32 %a) nounwind {
; RV32I-LABEL: sdiv_pow2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    srai a1, a0, 31
; RV32I-NEXT:    srli a1, a1, 29
; RV32I-NEXT:    add a0, a0, a1
; RV32I-NEXT:    srai a0, a0, 3
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = sdiv i32 %a, 8
  ret i32 %1
}

define i64 @sdiv64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: sdiv64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a4, %hi(__divdi3)
; RV32I-NEXT:    addi a4, a4, %lo(__divdi3)
; RV32I-NEXT:    jalr ra, a4, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = sdiv i64 %a, %b
  ret i64 %1
}

define i64 @sdiv64_constant(i64 %a) nounwind {
; RV32I-LABEL: sdiv64_constant:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi sp, sp, -16
; RV32I-NEXT:    sw ra, 12(sp)
; RV32I-NEXT:    sw s0, 8(sp)
; RV32I-NEXT:    addi s0, sp, 16
; RV32I-NEXT:    lui a2, %hi(__divdi3)
; RV32I-NEXT:    addi a4, a2, %lo(__divdi3)
; RV32I-NEXT:    addi a2, zero, 5
; RV32I-NEXT:    addi a3, zero, 0
; RV32I-NEXT:    jalr ra, a4, 0
; RV32I-NEXT:    lw s0, 8(sp)
; RV32I-NEXT:    lw ra, 12(sp)
; RV32I-NEXT:    addi sp, sp, 16
; RV32I-NEXT:    jalr zero, ra, 0
  %1 = sdiv i64 %a, 5
  ret i64 %1
}
