# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

# Set up some registers for demonstration
li gp, 3
la x1, inp_data

la x10,trap_handling
csrw mtvec,x10

test:
  la x5, 10           # Load address 10 into x5
  lw x6, 8(x1)        # Load word from address (x1 + 8) into x6
 
  ecall
 
  srli x10,x5,1


end:                 
  TEST_PASSFAIL
  
trap_handling:
  csrw mcause,0xb
  
  csrr x12,mepc
  addi x12,x12,4
  csrw mepc,x12
  
  mret
  

 
RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
  .word 6
  .word 7
RVTEST_DATA_END






