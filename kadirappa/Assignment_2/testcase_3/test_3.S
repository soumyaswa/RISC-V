//**********************************************************************
//    Originator: Kadirappa
//    assignment : 2
//    question no : 3 
//    Born-on Date: 2-9-2024
//**********************************************************************
//    Description: Indirect jump (jalr) in straight line code (no loops)
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test1:
  li x6,10
  addi x6,x6,10
  la x7,test2  //Store the address of test2 into x7 reg
  jalr x1,x7,0 //Jump to the address x7+0 and store the next instruction address in x1
  addi x18,x6,12
  sub x19,x18,x6

test2:         // After executing jalr instruction in test1, contriller transfer to this line
  li x29,8
  li x30,16
  li x31,14
  //jalr x1,x1,0
  add x20,x29,x30
  sub x29,x20,x31

 
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



