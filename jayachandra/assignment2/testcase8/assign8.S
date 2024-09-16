 # See LICENSE.vyoma for more details
 
//**********************************************************************
//    Originator: jayachandra
//    assignment : 2
//    question no : 8
//    Born-on Date: 10-09-2024
//**********************************************************************
//    Description: Unconditional Jumps in loops. nested for loops with varying nesting depth (1 to 8)
//**********************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64UF
RVTEST_CODE_BEGIN
 
 li gp,3
 
 li x8,2
 li x9,1
 la x20,inp_data
 flw f1,4(x20)
 flw f2,8(x20)
 
 loop:
   bge x9,x8,exit
   
   .rept 6
   
   li x2,3
   li x3,5
   add x4,x2,x3
   sub x5,x3,x2 
   div x5,x1,x2
   rem x5,x1,x2
   mulh x6,x5,x1
   andi x7,x6,35    
   ori x8,x7,25
   fdiv.s f7,f1,f2
   fsqrt.s f8,f1
   fmin.s f9, f1, f2 
   .endr
   
   
   
   
   addi x9,x9,1
   j loop
exit:nop

 
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