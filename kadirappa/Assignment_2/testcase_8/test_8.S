//**********************************************************************
//    Originator: Kadirappa
//    assignment : 2
//    question no : 8 
//    Born-on Date: 2-9-2024
//**********************************************************************
//    Description: Nested for loop.Loop inside loop
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20
  //Initialise the registers
  addi x6,x0,0   
  addi x7,x0,0
  addi x18,x0,1
  addi x19,x0,1
  addi x28,x0,2
  addi x29,x0,16

//Outer loop
for1:
  bge x18,x28,done1  //If condition is True, Branch is taken to done1

//Inner loop
for2:
  bge x19,x29,done2  // //If condition is True, Branch is taken to done2

  //Inner loop body
  li x20,10
  slli x20,x20,1
  li x21,4
  add x20,x20,x21
  srli x20,x20,1
  mul x22,x20,x21
  add x6,x6,x19      
  addi x19,x19,1     //x19 reg is increamented by 1
  j for2

//Outer loop Body
done2:
  /*addi x19,x0,1
  addi x29,x0,16
  addi x6,x0,0*/
  add x7,x7,x18
  addi x18,x18,1   //x18 reg is increamented by 1
  j for1

done1:
  addi x30,x0,100
 
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






