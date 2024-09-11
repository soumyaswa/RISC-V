//**********************************************************************
//    Originator: Kadirappa
//    assignment : 2
//    question no : 9 
//    Born-on Date: 2-9-2024
//**********************************************************************
//    Description: Nested loop with varying number of instructions inside the loop (1 to 64).Nested for loops with varying nesting depth (1 to 8)
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

//initialise the all loop counter registers values to Zero
   li x1,0  
   li x2,0
   li x3,0
   li x4,0
   li x5,0
   li x6,0
   li x7,0
   li x8,0
   li x10,2

   la x12,inp_data
   la x13,inp_data
   

outer_for:
  bge x1,x10,end      //if branch condition true the conroller goes to end lable (x1 >= x10)
  
for1:
  bge x2,x10,end1    //if branch condition true the conroller goes to end1 lable (x2 >= x10)

for2:
  bge x3,x10,end2    //if branch condition true the conroller goes to end2 lable (x3 >= x10)
 
for3:
  bge x4,x10,end3    //if branch condition true the conroller goes to end3 lable (x4 >= x10)
  
for4:
  bge x5,x10,end4    //if branch condition true the conroller goes to end4 lable (x5 >= x10)

for5:
  bge x6,x10,end5   //if branch condition true the conroller goes to end5 lable (x6 >= x10)
 
for6:
  bge x7,x10,end6   //if branch condition true the conroller goes to end6 lable (x7 >= x10)
  
for7:
  bge x8,x10,end7   //if branch condition true the conroller goes to end7 lable (x8 >= x10)

  add x18,x12,x13
  mul x18,x12,x13
  div x18,x12,x13
  
  addi x8,x8,1      //x8 increamented by 1
  bne x8,x10,for7   //if branch condition true the conroller goes to for7 lable (x8 != x10)

end7:
  
  or x18,x12,x13
  c.or x12,x13
  
  addi x7,x7,1
  bne x7,x10,for6   //if branch condition true the conroller goes to for6 lable (x7 != x10)

end6:

  and x18,x12,x13
  c.and x12,x13

  addi x6,x6,1
  bne x6,x10,for5  //if branch condition true the conroller goes to for5 lable (x6 != x10)

end5:

  xor x18,x12,x13
  c.xor x12,x13

  addi x5,x5,1
  bne x5,x10,for4  //if branch condition true the conroller goes to for4 lable (x5 != x10)

end4:

  sub x18,x12,x13
  c.sub x12,x13
 
  addi x4,x4,1
  bne x4,x10,for3  //if branch condition true the conroller goes to for3 lable (x4 != x10)

end3:

  mul x18,x12,x13
  mulh x18,x12,x13

  addi x3,x3,1
  bne x3,x10,for2  //if branch condition true the conroller goes to for2 lable (x3 != x10)

end2:

  div x18,x12,x13
  rem x18,x12,x13

  addi x2,x2,1
  bne x2,x10,for1  //if branch condition true the conroller goes to for1 lable (x2 != x10)

end1:

  addi x18,x12,12
  c.addi x12,12
  andi x18,x13,6
  c.andi x13,6

  addi x1,x1,1
  bne x1,x10,outer_for  //if branch condition true the conroller goes to outer_for lable (x1 != x10)

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






