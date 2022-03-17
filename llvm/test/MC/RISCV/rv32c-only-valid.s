# RUN: llvm-mc -triple=riscv32 -mattr=+c -show-encoding < %s \
# RUN:     | FileCheck -check-prefixes=CHECK,CHECK-INST %s
# RUN: llvm-mc -filetype=obj -triple riscv32 -mattr=+c < %s \
# RUN:     | llvm-objdump -mattr=+c -d - | FileCheck -check-prefix=CHECK-INST %s
# RUN: not llvm-mc -triple riscv32 \
# RUN:     -show-encoding < %s 2>&1 \
# RUN:     | FileCheck -check-prefixes=CHECK-NO-EXT %s
# RUN: not llvm-mc -triple riscv64 -mattr=+c \
# RUN:     -show-encoding < %s 2>&1 \
# RUN:     | FileCheck -check-prefixes=CHECK-NO-EXT %s

# CHECK-INST: c.jal    2046
# CHECK: encoding: [0xfd,0x2f]
# CHECK-NO-EXT:  error: instruction use requires an option to be enabled
c.jal    2046
