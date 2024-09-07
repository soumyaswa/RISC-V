//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 5
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: Call (jalr with rd != x0) and matching return in straight line code (no loops) 
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"           // including the test_macros.h file 
#include "riscv_test.h"            // including the riscv_test.h file
 
RVTEST_RV64U                       // 64-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                  // beginning of the code section

//Call (jalr with rd != x0) and matching return in straight line code (no loops) 

  li gp, 3                         // load the value 3 into the gp reg
# mem:                             // name of the label "mem"
#  li x20,0x80002068               // load the mem address into the reg x20
#  lw x21,0(x20)                   // load word the the address of 0(x20) into reg x21
  
  li x11,30                        // load the value 30 into the reg x11
  li x12, 30                       // load the value 30 into the reg x12
  
start:                             // name of the label "start"
  
  la x2,function                   // load the address of the function label  into the reg x2
  
  jalr x1,0(x2)                    // jumps into the address 0(x2) and store the return address into the reg x1
  
  li x10, 10                       // load the value 10 into the reg x10
  beq x11,x12,exit                 // comparing the two branches x11 and x12 if it is equal,then go to exit
  addi x10,x10,20                  // add the values in x10 and value 20,then result is placed into the reg x10

function:                          // name of the label "function"

  li x4, 2                         // load the value 2 into the reg x4
  li x5, 3                         // load the value 3 into the reg x5
  jalr x5, 0(x1)                   // jumps into the address 0(x1) and store the return address into the reg x5
        
exit:                              // name of the label "exit"
 nop                               // it will perform  the addi x0,x0,0 || pseudo instruction
  
  TEST_PASSFAIL                    // Checks the test is pass or fail
 
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