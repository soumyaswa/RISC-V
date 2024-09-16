 # See LICENSE.vyoma for more details
 
//**********************************************************************
//    Originator: jayachandra
//    assignment : 2
//    question no : 7 
//    Born-on Date: 09-09-2024
//**********************************************************************
//    Description: Unconditional Jumps in loops. nested for loops with varying nesting depth (1 to 8)
//**********************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32U
RVTEST_CODE_BEGIN
 
main:
  li x0,0        //load immediate value 0 into x0 register
  jal x1,loop_2  //jump to loop_2,return address saved in x1
  
 loop_2:
  li x1,1       //load immediate value 1 into x1 register
  jal x1, loop_3  //jump to loop_3,return address saved in x1
 
 loop_3:
  li x2,2          //load immediate value 2 into x2 register
  jal x1, loop_4   //jump to loop_4,return address saved in x1
 
 loop_4:
  li x3,3          //load immediate value 3 into x3 register
  jal x1, loop_5   //jump to loop_5,return address saved in x1
 
 loop_5:
  li x4,4          //load immediate value 4 into x4 register
  jal x1, loop_6   //jump to loop_6,return address saved in x1
  
 loop_6:
   li x5,5          //load immediate value 5 into x5 register
   jal x1, loop_7   //jump to loop_7,return address saved in x1
 loop_7:
   li x6,6          //load immediate value 6 into x6 register
  jal x1, loop_8    //jump to loop_8,return address saved in x1
   
 loop_8:
   li x7,8          //load immediate value 7 into x7 register
  jal x1, exit      //jump to exit,return address saved in x1
   
 exit:
   li x15,0        //end of the program
 
 
 
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