# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
 

li gp, 3
la x1, inp_data
 
la x9,trap_handler
csrw mtvec,x9
 
test:
  li x4, 10           # Load 10 into x5
  lw x6, 8(x1)        # Load word from address (x1 + 8) into x6
  ecall
  srli x10, x6, 5
  addi x10, x4, 2
  or x11, x10, x4
 
end:                 
  TEST_PASSFAIL

trap_handler:
  csrr x12,mepc
  addi x12,x12,4
  csrw mepc,x12
  mret
 

RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
RVTEST_DATA_END























