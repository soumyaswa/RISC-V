# See LICENSE.vyoma for more details
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64U
RVTEST_CODE_BEGIN
 
  li gp, 3
  li x1, 20
 
 
  # Addresses for test data
  la x5, inp_data    #loads the address of inp_data into x5 
  li x12, 8         #loads immediate values
  li x13, 20
  li x14, 28
 

 #BACK TO BACK LOADS - loads to the same destination register . source addresses can vary
test_1:
  lb x15, 0(x5)         
  lb x15, 1(x5)       #load byte -1 byte aligned  

  lh x15, 2(x5)
  lh x15, 4(x5)      #load half word -2 byte aligned  

  addi x7, x5, 4

  lw x15, 12(x5) 
  lw x15, 16(x5)   #load word -4 byte aligned  

  addi x8, x7, 4

  ld x15, 24(x5) 
  ld x15, 32(x5)   #load double word-8 byte aligned  

  #add x20, x15, x16

GO: lb x18, 16(x5)
 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .word 0x06627912    #80002000
  .word 0x06627912    #80002004
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .dword 0x1234567840053e92
  .word 0x40053e93
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
 
RVTEST_DATA_END
