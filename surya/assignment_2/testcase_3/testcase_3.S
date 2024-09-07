//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 3 
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: Unconditional Jumps (jal with rd = x0) with targets in  +/- 1 MB straight line code (no loops) both for compressed and non-compressed
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"               // including the test_macros.h file 
#include "riscv_test.h"                // including the riscv_test.h file
 
RVTEST_RV32U                           // 32-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                      // beginning of the code section
 
// Unconditional Jumps (jal with rd = x0) with targets in  +/- 1 MB straight line code (no loops) both for compressed and non-compressed

  li gp, 3 	                           // load the value 3 into the gp
 
Non_compressed:                        // name of the label "Non_compressed"

    li x1, 100                         // load the value 100 into the reg x1
    li x2, 200                         // load the value 200 into the reg x2

    jal x0, code_1                     // jumps into the address code_1 label and place the return address in reg x0

    li x3, 300                         // load the value 300 into the reg x3
    li x4, 400                         // load the value 400 into the reg x4

code_1:                                // name of the label "code_1"
    li x5, 500                         // load the value 500 into the reg x5

    jal x0, code_2                     // jumps into the address code_2 label and place the return address in reg x0 
    
    li x6, 600                         // load the value 600 into the reg x6

code_2:                                // name of the label "code_2"

    li x7, 700                         // load the value 700 into the reg x7
    li x10, 10                         // load the value 10 into the reg x10

compressed :                           // name of the label "compressed"

    c.li x1, 1                         // load the value 1 into the reg x1
    c.li x2, 2                         // load the value 2 into the reg x2

    c.j c_1                            // jumps into the address c_1 label 
 
    c.li x3, 3                         // load the value 3 into the reg x3
    c.li x4, 4                         // load the value 4 into the reg x4
             
c_1:                                   // name of the label "c_1"
    c.li x5, 5                         // load the value 5 into the reg x5
    c.j c_2                            // jumps into the address c_2 label

    c.li x6, 6                         // load the value 6 into the reg x6

c_2:                                   // name of the label "c_2"
   
    c.li x7, 7                         // load the value 7 into the reg x7
    c.li x10, 10                       // load the value 10 into the reg x10

 
  TEST_PASSFAIL                        // Checks the test is pass or fail
 
RVTEST_CODE_END                        // end of the code section
 
  .data                                // input the test data
 
RVTEST_DATA_BEGIN                      // beginning of the data section
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
  
RVTEST_DATA_END                        // end of the data section