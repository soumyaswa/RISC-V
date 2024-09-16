# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64U
RVTEST_CODE_BEGIN
  li gp, 3
  li x1, 20

  # Addresses for test data
  la x5, inp_data
  li x2, 8 
  li x4, 20
#OVERLAPPING LOADS

test_5:
  lh x2, 2(x5) 
  lh x4, 2(x5)
  addi x7,x2,-2
  addi x6,x4,-1
  lw x2, 4(x5) 
  lw x4, 4(x5)
  andi x7,x2,2
  andi x6,x4,1
  ld x2, 8(x5) 
  ld x4, 8(x5)
  
#OVERLAPPING stores

test_6:
  li x2, 8 
  li x4, 20
  sh x2, 2(x5) 
  sh x4, 2(x5)
  sw x2, 4(x5) 
  sw x4, 4(x5)
  sd x2, 8(x5) 
  sd x4, 8(x5)
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
