# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

START:
  
li gp, 3		# initializes gp with 3
li x1, 20		# loads 20 into x1

la x5, inp_data		# Addresses for test data
la x6, data1		
  
instruction:

li x7,10     		# loads 20 into x1
lr.w.aq x2, (x5)        # load reserved word with acquire
lr.w x8, (x5)           # load reserved word
lw x4, 12(x5)           # loads a word from the address x5 + 12 into x4

lr.w x8, (x6)
sw x1, 0(x6)
sc.w x8, x7, (x6)

sw x7, 0(x5)
add x6, x4, x7
sc.w.rl x2, x6, (x5)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA
data1: 
  .word 0xaabbccc

inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  

RVTEST_DATA_END












