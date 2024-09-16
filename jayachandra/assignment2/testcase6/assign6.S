 # See LICENSE.vyoma for more details
 
//**********************************************************************
//    Originator: jayachandra
//    assignment : 2
//    question no : 6
//    Born-on Date: 09-09-2024
//**********************************************************************
//    Description: conditional branches in loops. nested for loops with varying nesting depth (1 to 8)
//**********************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32U
RVTEST_CODE_BEGIN
 
main:
 li x15,0               #Loads the value 0 into register x15.
 beq x15,zero,loop_2    #Branches to loop_2 if the value in x15 is equal to 0 (which it is).
 
 loop_2:                  
  li x1,1               #Loads the value 1 into register x1.
  li x2,2              #Loads the value 2 into register x2.
  li x4,4               #Loads the value 4 into register x4.
  add x3,x1,x2          #Adds the values in x1 and x2, storing the result in x3.
  #beq x3,x4,loop_5      #Branches to loop_3 if the value in x3 is equal to the value in x4.
  bne x3,x4,loop_5
 loop_3:
  addi x2,zero,4        # Adds 4 to the value in x2, storing the result in x2.
  addi x3,zero,1        # Adds 1 to the value in x3, storing the result in x3.
  slli x3,x3,2          # Shifts the value in x3 left by 2 bits.
  beq x2,x3,loop_4      # Branches to loop_4 if the value in x2 is equal to the value in x3.
  
 loop_4:
  li x3,3               #Loads the value 3 into register x3.
  li x4,3               #Loads the value 4 into register x4.
  beq x3,x4,loop_5      #Branches to loop_5 if the value in x3 is equal to the value in x4.
 
 loop_5:
  li x4,3               #Loads the value 4 into register x4.
  li x5,3               #Loads the value 5 into register x5.
  beq x4,x5,loop_6      #Branches to loop_6 if the value in x4 is equal to the value in x5.
  
 loop_6:
   li x5,5              #Loads the value 5 into register x5.
   li x6,6              #Loads the value 6 into register x6.
   beq x5,x6,loop_7     #Branches to loop_7 if the value in x5 is equal to the value in x6.
   
 loop_7:
   li x6,6              #Loads the value 6 into register x6.
   li x7,6              #Loads the value 7 into register x7.
    beq x6,x7,loop_8    #Branches to loop_8 if the value in x6 is equal to the value in x7.
   
 loop_8:
   li x7,8              #Loads the value 8 into register x7.
   j exit               # exit
   
 exit:
   li x15,0              #Loads the value 0 into register x15.
 
 
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