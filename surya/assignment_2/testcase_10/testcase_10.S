//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 10 
//    Born-on Date: 06-09-2024
//**********************************************************************
//    Indirect function calls using jalr
//**********************************************************************


# See LICENSE.vyoma for more details
 
#include "test_macros.h"           // including the test_macros.h file 
#include "riscv_test.h"            // including the riscv_test.h file
 
RVTEST_RV64U                       // 64-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                  // beginning of the code section

// Indirect function calls using jalr

   li gp, 3                        // load the value 3 into gp
   la x6,inp_data                  // load the inp_data into reg x6
      
start:                             // name of the label "start"
    
    la x4, f1                      // load the f1 label address into the reg x4
    jalr x1, x4, 0                 // jump into the address of 0(x4) and place the return address into the reg x1
    
    li x13, 10                     // load the value 10 into the reg x13
    
    la x8, f2                      // load the f2 label address into the reg x8
    jalr x1, x8, 0                 // jump into the address of 0(x8) and place the return address into the reg x1
                    
    li x14, 20                     // load the value 20 into the reg x14
    bne x4,x8,exit                 // it will compare the x4,x8 regs if it is not equal, then goto exit
    
f1:                                // name of the label "f1"
    li x11, 42                     // load the value 42 into the reg x11
    sw x2, 0(x6)                   // store the address 0(x6) into  the reg x2
    jalr x5,x1,0                   // jump into the address of 0(x1) and place the return address into the reg x5
             
f2:                                // name of the label "f2"
    li x11, 84                     // load the value 84 into the reg x11
    sw x12, 0(x6)                  // store the address 0(x6) into  the reg x12
    jalr x5,x1,0                   // jump into the address of 0(x1) and place the return address into the reg x5
    
exit:                              // name of the label "exit"
    nop                            // it is a pseudo inst, performs addi x0,x0,0
    
     TEST_PASSFAIL                 // Checks the test is pass or fail
 
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