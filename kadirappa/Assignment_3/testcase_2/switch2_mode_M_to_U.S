//**********************************************************************
//    Originator: Kadirappa
//    assignment : 3
//    question no : 2 
//    Born-on Date: 10-09-2024
//**********************************************************************
//    Description: Switching Machine mode to User mode
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

lable1:
  li x2,2
  li x3,4
  la x18,inp_data

  li x6,0x000
  csrs mstatus,x6
  csrr x7,mstatus

  srli x2,x2,1
  slli x4,x4,2
  mul x19,x4,x2
  ori x19,x18,0 
  xor x19,x4,x18

  csrr x7,mepc
  la x7,l2
  csrw mepc,x7
  mret

l2:
  add x4,x3,x2
  c.add x3,x2
  and x4,x3,x2
  andi x4,x18,5
  //c.and x3,x2



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



