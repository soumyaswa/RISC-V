//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 2 
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: Conditional Branches in straight line code (no loops) both for compressed and non-compressed
//**********************************************************************

# See LICENSE.vyoma for more details
 
#include "test_macros.h"                   // including the test_macros.h file 
#include "riscv_test.h"                    // including the riscv_test.h file
 
RVTEST_RV32U                               // 32-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN                          // beginning of the code section

// Conditional Branches in straight line code (no loops) both for compressed and non-compressed
 
  li gp, 3                                 // load the value 3 into the reg 3
 
Non_compressed:                            // Name of the label "Non_compressed"
  li x1, 8                                 // load the value 8 into the reg x1
  li x2, 20                                // load the value 20 into the reg x2
  li x4,0                                  // load the value 0 into the reg x4
  add x11, x1, x2                          // add the values in x1,x2 and the result is placed into the reg x11
  li x14, 27                               // load the value 27 into the reg x14
 
equal:                                     // Name of the label "equal"
  addi x14, x14,1                          // add the values in x14 and value 1,then result is placed into the reg x14
  beq x11, x14, exit                       // comparing the two branches x11 and x14, if it is equal,then go to exit
 
not_equal:                                 // Name of the label "not_equal"
  bne x2, x1, Go                           // comparing the two branches x2 and x1, if it is not equal,then go to Go
  
greater_than:                              // Name of the label "greater_than"
  li x5, 12                                // load the value 12 into the reg x5
  bge x5, x1, exit                         // comparing the two branches x5 and x1, if x5 is greater than x1,then go to exit
 
less_than:                                 // Name of the label "less_than"
  li x6, 2                                 // load the value 2 into the reg x6
  bge x6, x14, end                         // comparing the two branches x6 and x14, if x6 is greater than x14,then go to end
 
exit:                                      // Name of the label "exit"
    addi x4,x4,1                           // add the values in x4 and value 1,then result is placed into the reg x4
Go:                                        // Name of the label "Go"
    li x6, 10                              // load the value 10 into the reg x6
    
compressed:                               // Name of the label "compressed"
    c.li x10, 5                            // load the value 5 into the reg x10
    c.bnez x10,zero                        // comparing the two branches x10 and x0, if it is not equal,then go to zero
    c.beqz x10,end                         // comparing the two branches x10 and x0, if it is equal,then go to exit 
    
    c.li x9, 1                             // load the value 1 into the reg x9
 
zero:                                      // Name of the label "zero"
    c.li x9, 2                             // load the value 2 into the reg x9
end:                                       // Name of the label "end"
    c.li x5, 10                            // load the value 10 into the reg x5

 
 
  TEST_PASSFAIL                            // Checks the test is pass or fail
 
RVTEST_CODE_END                            // end of the code section
 
  .data                                    // input the test data
 
RVTEST_DATA_BEGIN                          // beginning of the data section
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
 
RVTEST_DATA_END                            // end of the data section