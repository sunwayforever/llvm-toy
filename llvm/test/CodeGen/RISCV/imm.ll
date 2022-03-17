; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32I
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64I

; Materializing constants

define i32 @zero() nounwind {
; RV32I-LABEL: zero:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, 0
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: zero:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 0
; RV64I-NEXT:    jalr zero, ra, 0
  ret i32 0
}

define i32 @pos_small() nounwind {
; RV32I-LABEL: pos_small:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, 2047
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: pos_small:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 2047
; RV64I-NEXT:    jalr zero, ra, 0
  ret i32 2047
}

define i32 @neg_small() nounwind {
; RV32I-LABEL: neg_small:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, -2048
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: neg_small:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 0
; RV64I-NEXT:    addiw a1, a0, 0
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    addiw a0, a0, -2048
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    srli a0, a0, 32
; RV64I-NEXT:    or a0, a1, a0
; RV64I-NEXT:    jalr zero, ra, 0
  ret i32 -2048
}

define i32 @pos_i32() nounwind {
; RV32I-LABEL: pos_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 423811
; RV32I-NEXT:    addi a0, a0, -1297
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: pos_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 423811
; RV64I-NEXT:    addiw a0, a0, -1297
; RV64I-NEXT:    jalr zero, ra, 0
  ret i32 1735928559
}

define i32 @neg_i32() nounwind {
; RV32I-LABEL: neg_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 912092
; RV32I-NEXT:    addi a0, a0, -273
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: neg_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 0
; RV64I-NEXT:    addiw a0, a0, 0
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    lui a1, 912092
; RV64I-NEXT:    addiw a1, a1, -273
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    srli a1, a1, 32
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    jalr zero, ra, 0
  ret i32 -559038737
}

define i64 @pos_imm64() {
; RV32I-LABEL: pos_imm64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 430355
; RV32I-NEXT:    addi a0, a0, 787
; RV32I-NEXT:    lui a1, 7018
; RV32I-NEXT:    addi a1, a1, -1212
; RV32I-NEXT:    jalr zero, ra, 0
;
; RV64I-LABEL: pos_imm64:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 7018
; RV64I-NEXT:    addiw a0, a0, -1212
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    lui a1, 430355
; RV64I-NEXT:    addiw a1, a1, 787
; RV64I-NEXT:    slli a1, a1, 32
; RV64I-NEXT:    srli a1, a1, 32
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    jalr zero, ra, 0
  ret i64 123456757922083603
}
