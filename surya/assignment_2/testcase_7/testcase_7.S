//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 7 
//    Born-on Date: 06-09-2024
//**********************************************************************
//    Description: Unconditional Jumps in loops. nested for loops with varying nesting depth (1 to 8)
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"           // including the test_macros.h file 
#include "riscv_test.h"            // including the riscv_test.h file
 
RVTEST_RV64U                       // 64-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                  // beginning of the code section

// Unconditional Jumps in loops. nested for loops with varying nesting depth (1 to 8)
    li gp,3                        // load the value 3 into the gp
    la x30,inp_data                // load the inp_data into the reg x30
    
    li x1, 0                       // load the value 0 into the reg x1
   
    li x10, 1                      // load the value 1 into the reg x10
    li x11, 1                      // load the value 1 into the reg x11
    li x12, 1                      // load the value 1 into the reg x12
    li x13, 1                      // load the value 1 into the reg x13
    li x14, 1                      // load the value 1 into the reg x14
    li x15, 1                      // load the value 1 into the reg x15
    li x16, 1                      // load the value 1 into the reg x16
    li x17, 1                      // load the value 1 into the reg x17
    
loop1:                             // name of the label "loop1"
    bge x1,x10, end1               // it will compare x1,x10 if x1 greater than x10 means, it will goto end1
    li x2, 0                       // load the value 0 into the reg x2
    
loop2:                             // name of the label "loop2"
    bge x2,x11, end2               // it will compare x2,x11 if x1 greater than x10 means, it will goto end2
    li x3, 0                       // load the value 0 into the reg x3
    
loop3:                             // name of the label "loop3"
    bge x3, x12, end3              // it will compare x3,x12 if x1 greater than x10 means, it will goto end3
    li x4, 0                       // load the value 0 into the reg x4
    
loop4:                             // name of the label "loop4"
    bge x4, x13, end4              // it will compare x4,x13 if x1 greater than x10 means, it will goto end4
    li x5, 0                       // load the value 0 into the reg x5
    
loop5:                             // name of the label "loop5"
    bge x5, x14, end5              // it will compare x5,x14 if x1 greater than x10 means, it will goto end5
    li x6, 0                       // load the value 0 into the reg x6
    
loop6:                             // name of the label "loop6"
    bge x6, x15, end6              // it will compare x6,x15 if x1 greater than x10 means, it will goto end6
    li x7, 0                       // load the value 0 into the reg x7
    
loop7:                             // name of the label "loop7"
    bge x7, x16, end7              // it will compare x7,x16 if x1 greater than x10 means, it will goto end7
    li x8, 0                       // load the value 0 into the reg x8
    
loop8:                             // name of the label "loop8"
    bge x8, x17, end8              // it will compare x8,x17 if x1 greater than x10 means, it will goto end8
    
    lw x9,0(x30)                  // load the address 0(x30) into the reg x9
    addi x9, x9, 1                // add the value 1 to x9 and store the result into the reg x9
    sw x9,0(x30)                  // store the address 0(x30) into the reg x9
    
    addi x8,x8,1                  // add the value 1 to x8 and store the result into the reg x8
    j loop8                        // jump into loop8
    
end8:                             // name of the label "end8"
    addi x7, x7, 1                // add the value 1 to x7 and store the result into the reg x7
    j loop7                       // jump into loop7
    
end7:                             // name of the label "end7"
    addi x6, x6, 1                // add the value 1 to x6 and store the result into the reg x6
    j loop6                       // jump into loop6
    
end6:                             // name of the label "end6"
    addi x5,x5, 1                 // add the value 1 to x5 and store the result into the reg x5
    j loop5                       // jump into loop5
    
end5:                             // name of the label "end5"
    addi x4, x4, 1                // add the value 1 to x4 and store the result into the reg x4
    j loop4                       // jump into loop4
    
end4:                             // name of the label "end4"
    addi x3, x3, 1                // add the value 1 to x3 and store the result into the reg x3
    j loop3                       // jump into loop3
    
end3:                             // name of the label "end3"
    addi x2, x2, 1                // add the value 1 to x2 and store the result into the reg x2
    j loop2                       // jump into loop2
    
end2:                             // name of the label "end2"
    addi x1, x1, 1                // add the value 1 to x1 and store the result into the reg x1
    j loop1                       // jump into loop1
    
end1:                             // name of the label "end1"
    li x20, 0                     // load the value 0 into the reg x20
    li x21, 93                    // load the value 93 into the reg x21
    nop                           // it is a pseudo inst, performs addi x0,x0,0
    
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