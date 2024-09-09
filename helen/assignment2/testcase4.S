# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U      # 32-bit RISC-V user mode  
RVTEST_CODE_BEGIN # beginning of the test code section
 

#Indirect jumps (jalr) in straight line code (no loops)
  
li gp, 3
li x1, 20

jump_test:  
  la x4, target  #loads adress of target into x4
  jalr x1, x4, 2  #jumps to x4+2 and stores the return address (address of the next instruction) in x1
  li x4, 1             
  li x5, 2  

target:
    li x6, 3             #loads immediate value 3 into x6 
    li x7, 4              #loads immediate value 4 into x7 
    li x10, 10            #loads immediate value 10 into x10 


  TEST_PASSFAIL      # Checks if the test passed or failed

RVTEST_CODE_END      # end of the test code section

  .data             # beginning of the data section

RVTEST_DATA_BEGIN
  TEST_DATA

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
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74
RVTEST_DATA_END      ## end of the test data section

