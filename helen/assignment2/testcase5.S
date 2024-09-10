# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN
 
li gp,3

#Call (jalr with rd != x0) and matching return in straight line code (no loops)

jump_test:  
  la x1, target        # loads address of target into x1
  jalr x1, x1, 0       # jumps to address in x1 (address of target) and stores the return address in x1
  li x10, 10 
  li x7, 20
  sub x6, x10, x7      # subtracts x7 from x10 and stores result in x6 (x6 = x10 - x7)
  mul x8, x10, x7      # multiplies x10 by x7 and stores result in x8 (x8 = x10 * x7)
  xor x9, x10, x7      # computes bitwise XOR of x10 and x7 and stores result in x9 (x9 = x10 ^ x7)
  jalr x1, x1, 0       # jumps to return address stored in x1 and links register
  j end  

target:
  li x4, 2
  sub x5, x4, x4      # subtracts x4 from itself (x5 = x4 - x4, which is 0)
  mul x6, x4, x4      # multiplies x4 by itself (x6 = x4 * x4)
  xor x7, x4, x4      # computes bitwise XOR of x4 and itself (x7 = x4 ^ x4, which is 0)
  jalr x1, x1, 0      # jumps to return address stored in x1 and links register
  li x5, 3              
  
end:
  nop

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



