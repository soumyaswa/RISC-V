//**********************************************************************
//    Originator: Surya
//    assignment : 3
//    question no : 1 
//    Born-on Date: 11-09-2024
//**********************************************************************
//    Description: Switch mode from machine to supervisor mode
//**********************************************************************


# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp,3
m_mode :
  
  la x6, 0x800
  la x30,inp_data
  la x31,inp_data
   
  csrs mstatus, x6           // loading the mstatus with 800,mpp is 01
  csrr x7,mstatus
  
  add x26,x30,x31
  sub x27,x30,x31
  mul x28,x30,x31
  div x29,x30,x31
  and x15,x30,x31
  or x18,x30,x31
  xor x19,x30,x31
  
  la x11,s_mode
  csrw mepc,x11              // loading the address of s_mode into mepc 
  mret                       // return to supervisor mode
  
s_mode:

  addi x1,x0,10
  li x2, 4
  sw x2, 0(x30)
min:
  amomin.w x4,x1,0(x30)
add:
  amoadd.w x5,x1,0(x30)
swap :
  amoswap.w x16,x1,0(x30)
binary_op:
  amoand.w x17,x1,0(x30)
  amoor.w x8,x1,0(x30)
  amoxor.w x9,x1,0(x30)
max :
  amomax.w x10,x1,0(x30)
  


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
