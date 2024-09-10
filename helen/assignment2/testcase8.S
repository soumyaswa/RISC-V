# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN


  li gp, 3
    
# One Loop with varying number of instructions inside the loop. number of instructions varying from 1 to 64



     li x8, 2          # no. of iteration
     li x9, 0          # loop counter 

     la x22,inp_data
     la x24,data1

     li x11,3
     addi x12,x11,5
     li x1,7

      slli x25, x25, 16
      slli x25, x25, 16
      li x21, 0
      or x21, x21, x25
	
      la x19,data2

loop:
    bge x9,x8,exit
  
   .rept 8
        mul x10, x11, x12   #multiplication
        div x13, x14, x10   #  division 
        andi x16, x12, 7  # Bitwise AND immediate 
        ori x18, x11, 1   # Bitwise OR immediate 
    .endr

    .rept 8
        amoadd.w x20, x16, 0(x22)  # Atomic addition (address in x22, value in x21)
        amoxor.w x23, x18, 0(x24)  # Atomic XOR (address in x25, value in x24)
    .endr
   
    .rept 4
        fmv.d.x f0, x21
        flw f5, 0(x19)
        fadd.s f7, f5,f0
        fmadd.s f7,f7,f7,f5
    .endr

   addi x9,x9,1
   j loop


 
   
exit:                              
   nop



  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

data1:
  .dword 0x00600012

data2:
  .float 1.5

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








