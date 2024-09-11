# See LICENSE.vyoma for more details
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64U
RVTEST_CODE_BEGIN
 
  li gp, 3
  li x1, 20
 
 
  # Addresses for test data
  la x5, inp_data 
  li x12, 8 
  li x13, 20
  li x14, 28
 
#BACK TO BACK STORES WITH LOAD TO THE SAME ADDRESS
test_6:
  sb x15, 0(x5) 
  sb x15, 1(x5)
  li x7,6
  addi x7,x7,5
  add x6,x7,x7
  lb x15, 0(x5)

  sh x15, 12(x5) 
  sh x15, 16(x5)
  li x7,16
  addi x7,x7,8
  add x6,x7,x7
  lh x15, 12(x5)

  
  sw x15, 24(x5) 
  sw x15, 28(x5)
  li x12,6
  addi x7,x12,5
  add x6,x7,x12
  lw x15, 24(x5)
  

  sd x15, 40(x5) 
  sd x15, 48(x5) 
  li x12,6
  addi x7,x12,5
  add x6,x7,x12
  ld x15, 40(x5)


  #add x20, x15, x16

GO: lb x18, 16(x5)
 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
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
 
RVTEST_DATA_END



