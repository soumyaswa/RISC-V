//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 4 
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: Indirect jumps (jalr) in straight line code (no loops) 
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"       // including the test_macros.h file  
#include "riscv_test.h"        // including the riscv_test.h file
 
RVTEST_RV32U                   // 32-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN              // beginning of the code section

// Indirect jumps (jalr) in straight line code (no loops) 

  li gp, 3                     // load the value 3 into the gp
start:                         // Name of the label "start"
  la x2, target                // load the address of the target label into the reg x2
  
  jalr x1,0(x2)                // jump into the address of 0(x2) and store the return address into reg x1
  
  li x4, 1                     // load the value 1 into the reg x4
  li x5, 2                     // load the value 2 into the reg x5
  
target:                        // Name of the label "target"
    li x6, 3                   // load the value 3 into the reg x6
    li x7, 4                   // load the value 4 into the reg x7
    li x10, 10                 // load the value 10 into the reg x10
  
  
  TEST_PASSFAIL                // Checks the test is pass or fail
 
RVTEST_CODE_END                // end of the code section
 
  .data                        // input the test data
 
RVTEST_DATA_BEGIN              // beginning of the data section
  TEST_DATA
 
 
inp_data:
  .word 0x06627912                 // memory address 8000_2000
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
RVTEST_DATA_END                 // end of the data section