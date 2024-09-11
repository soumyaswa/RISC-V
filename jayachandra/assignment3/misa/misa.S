# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

main:
 li gp,3

 li x6,0x1105  
 csrw misa,x6
 
test1:
 
 li x2,10
 li x3,20
 add x4,x2,x3
 mul x5,x2,x3
 sub x8,x3,x2
 div x7,x2,x3
 
test2:

  addi x6,x4, -20 
  andi x7,x6,35     
  ori x8,x7,25 
  
test3:

  li x1, 30
  li x2, 4
  mul x4,x1,x2
  div x5,x1,x2
  rem x5,x1,x2
  mulh x6,x5,x1
  mulhsu x7,x1,x2
  mulhu x8,x7,x2
  mulw x9,x8,x2
  divu x6,x5,x2
  
test4:

li x1, 4
  li x4, 5
  la x30,inp_data
  sd x1,0(x30)
min:
  amomin.w x15,x4,0(x30)
add:
  amoadd.w x10,x4,0(x30)
swap :
  amoswap.w x11,x4,0(x30)
binary_op:
  amoand.w x12,x4,0(x30)
  amoor.w x13,x4,0(x30)
  amoxor.w x14,x4,0(x30)
max:
  amomax.w x17,x4,0(x30)
  amomaxu.w x18,x4,0(x30)
  
test5:

 c.li x2,10
 c.li x3,20
 c.add x4,x2
 #c.and x4,x2

 
test6:

 la x1,inp_float
 la x2,inp_float
 flw f1,4(x2)
 flw f2,8(x2)
 fadd.s f4,f1,f2
 fsub.s f5,f2,f1
 fmul.s f6,f1,f2
 fdiv.s f7,f1,f2
 fsqrt.s f8,f1
 fmin.s f9, f1, f2
 fmax.s f10, f1, f2 
 
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
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5
RVTEST_DATA_END
