//**********************************************************************
//    Originator: Kadirappa
//    assignment : 2
//    question no : 2 
//    Born-on Date: 2-9-2024
//**********************************************************************
//    Description: Conditional branchesin straight line code (no loops) both for compressed and non-compressed
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN
/*
  li gp, 3
  li x1, 20

noncomp:
  li x6,20  //x6=20
  li x7,65  //x7=65
  li x28,85  //x8=85
  bgt x28,x7,test1  //condition true ,so the contriller goes to test1
  addi x28,x7,1  //if the condition is false this instruction will execute

test3:
  add x9,x6,x7  //x6+x7=x9 | x9=85
  blt x6,x9,test2  //condition is true , the controller goes to test2
  

test2:
  add x18,x9,x28  //x9+x8=x18 | x18=170
  li x29,170      //x29=170
  beq x18,x29,test4  //condition is true , the controller goes to test3


test1:
  li x29,166    //x29=166
  bne x18,x29,test3  //condition is true , the controller goes to test4


test4:
  bge x18,x29,test5  //condition is true , the controller goes to test5


test5:
  add x18,x18,x29  //x18+x29=x18 | x18=336
  
 
comp:
  c.li x15,12
  c.li x14,0
  c.bnez x15,lable1  //Branch taken to  lable1
  
lable1:
  c.beqz x14,lable2  //Branch taken to lable2
  c.add x15,x15
  
lable2:
  c.and x15,x15*/
lable:
 li x1,2
  li x2,4
  add x3,x2,x1
  c.add x3,x2
 
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
  .word 0x15010699
  .word 0x15010699
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



