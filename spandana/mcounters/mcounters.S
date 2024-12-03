#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

START:
    li gp,3
   

    li x23, 5
    csrw mcounteren, x23
    li x24, 5
    csrw mcountinhibit, x24
    
    csrr x11, mcycle                    # Read mcycle counter into x11
    csrr x12, minstret  		 # Read minstret counter into x12

    li x8, 3
    li x9, 0

for_loop:
    bge x9,x8, exit
    addi x9, x9, 1
    li x13, 10				 # series of instructions to increment minstret and mcycle
    li x14, 20
    add x15, x14, x13    
    sub x16, x14, x13 
    slli x17, x13, 2
    and x18, x13, x14  
    j for_loop

exit:
    csrr x20, mcycle   			 # Read machine cycle counter into x1 again
    csrr x21, minstret 			 # Read retired instruction counter into x2 again
    sub x20,x20,x11
    sub x21,x21,x12
  

TEST_PASSFAIL
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