//**********************************************************************
//    Originator: Kadirappa
//    assignment : 4
//    question no : 1 
//    Born-on Date: 12-10-2024
//**********************************************************************
//    Description: LR and SC
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

lable1:
  la x10,inp_data
  la x13,inp_data
  li x14,0x80002008
  lr.w.aq x11,(x10) 
  mul x18,x13,x10
  div x18,x13,x10
  //lr.w x6,(x13)
  //sc.w x7,x13,(x10)  //Hear we using reserved location x10, So The x12 reg in 31 line filled with "1" 
  //sc.w.rl x12,x13,(x9) //If use differrent location it will lead to exception trap_store_access_fault
  sc.w.rl x12,x14,(x10) 

  lr.w x6,(x13)
  lr.w x6,(x13)
 // sc.w x7,x13,(x15)  ////If use differrent location it will lead to exception trap_store_access_faul



//fail:nop

 
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





