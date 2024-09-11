//**********************************************************************
//    Originator: Kadirappa
//    assignment : 2
//    question no : 1 
//    Born-on Date: 2-9-2024
//**********************************************************************
//    Description: RAW, WAR, WAW Hazard
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20
// rd - Memory to Register
// wr - register to Memory
raw:
  li x6,12
  li x7,24
  li x28,18
  //RAW
  add x18,x6,x7    // Write the result into x18
  sub x19,x18,x28  // The Sub reads the output of the addition(x18)
  //add x18,x6,x7

war:
  li x29,8
  li x30,16
  li x31,14
  //WAR
  add x20,x29,x30 //Write 8 into x29  
  sub x29,x20,x31 //usinf same reg we read the data. Generally Anti dependency that does not create any issue 

waw:
  //WAW
  add x18,x6,x7
  sub x18,x19,x28
 
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




