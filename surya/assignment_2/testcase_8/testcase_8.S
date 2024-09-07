//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 8 
//    Born-on Date: 06-09-2024
//**********************************************************************
//    Description: One Loop with varying number of instructions inside the loop. number of instructions varying from 1 to 64
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"           // including the test_macros.h file 
#include "riscv_test.h"            // including the riscv_test.h file
 
RVTEST_RV64U                       // 64-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                  // beginning of the code section

// One Loop with varying number of instructions inside the loop. number of instructions varying from 1 to 64
   li gp,3                         // load the value 3 into the gp
   la x1,inp_data                  // load the inp_data into the reg x1
   la x2,inp_data                  // load the inp_data into the reg x2
   li x4,0                         // load the value 0 into the reg x4
   li x5,1                         // load the value 1 into the reg x5
 
loop:                              // name of the label "loop"
   beq x4,x5,exit                  // it will compare x4,x5 if they are equal means, it will  goto exit
 
   .rept 64                        // it is a repeat statement, it will repeat 64 times
   add x10,x1,x2                   // add the reg x1,x2 and store the result into the reg x10
   mul x11,x1,x2                   // mul the reg x1,x2 and store the result into the reg x11
   and x12,x1,x2                   // and the reg x1,x2 and store the result into the reg x12
   or x13,x1,x2                    // or the reg x1,x2 and store the result into the reg x13
   xor x14,x1,x2                   // xor the reg x1,x2 and store the result into the reg x14
   .endr                           // end of the repeat statement
 
   addi x4,x4,1                    // add the value 1 to x4 and store the result into the reg x4
   j loop                          // jump into the loop label

exit:                              // name of the label "exit"
   nop                             // it is a pseudo inst, performs addi x0,x0,0

TEST_PASSFAIL                      // Checks the test is pass or fail
 
RVTEST_CODE_END                    // end of the code section
 
  .data                            // input the test data
 
RVTEST_DATA_BEGIN                  // beginning of the data section
  TEST_DATA
  
inp_data:
  .word 0x06627912                 //  memory address 8000_2000
  .word 0x06627912                 // 8000_2004
  .word 0x584944fc                 // 8000_2008
  .word 0x584944fc                 // 8000_200c
  .word 0x558f5366                 // 8000_2010
  .word 0x558f5366                 // 8000_2014
  .word 0x29df2fb1                 // 8000_2018
  .word 0x29df2fb1                 // 8000_201c
  .word 0x40053e92                 // 8000_2020
  .word 0x40053e92                 // 8000_2024
  .word 0x17010699                 // 8000_2028
  .word 0x17010699                 // 8000_202c
  .word 0x594b9169                 // 8000_2030
  .word 0x594b9169                 // 8000_2034
  .word 0x64cd11c7                 // 8000_2038
  .word 0x64cd11c7                 // 8000_203c
  .word 0x6133a31e                 // 8000_2040
  .word 0x6133a31e                 // 8000_2044
  .word 0x2a9e3a3d                 // 8000_2048
  .word 0x2a9e3a3d                 // 8000_204c
  .word 0x59f86117                 // 8000_2050
  .word 0x59f86117                 // 8000_2054
  .word 0x39214611                 // 8000_2058
  .word 0x39214611                 // 8000_205c
  .word 0x6ec633f5                 // 8000_2060
  .word 0x6ec633f5                 // 8000_2064
  .word 0x4910a7b3                 // 8000_2068
  .word 0x4910a7b3                 // 8000_206c
  .word 0x3392ec72                 // 8000_2070
  .word 0x3392ec72                 // 8000_2074
 
RVTEST_DATA_END                    // end of the data section



