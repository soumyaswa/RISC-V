//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 1 
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: RAW,WAR,WAW Hazards
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"  // including the test_macros.h file 
#include "riscv_test.h"   // including the riscv_test.h file

RVTEST_RV32U              // 32-bit RISC-V USER Mode 
RVTEST_CODE_BEGIN         // beginning of the code section

// RAW,WAR,WAW Hazards

  li gp, 1                // loading the value 1 into the gp
  li x1, 2                // loading the value 2 into the reg x1
  li x2, 3                // loading the value 3 into the reg x2
  li x11, 11              // loading the value 11 into the reg x11
  li x12, 12              // loading the value 12 into the reg x12
  li x21, 10              // loading the value 10 into the reg x21
  li x22,  20             // loading the value 20 into the reg x22
  
RAW_hazard:               // Name of the label "RAW_Hazard"
 
  add x5,x1,x2            // the values in the x1,x2 are added and the result is placed into the reg x5
  mul x6,x5,x1            // the values in the x5,x1 are multiplied and the result is placed into the reg x6
  
WAR_hazard:               // Name of the label "WAR_Hazard"
  
  add x13,x11,x12         // the values in the x11,x12 are added and the result is placed into the reg x13
  mul x12,x11,x1          // the values in the x11,x1 are multiplied and the result is placed into the reg x12
  
WAW_hazard:               // Name of the label "WAW_Hazard"

  add x4,x21,x22          // the values in the x21,x22 are added and the result is placed into the reg x4
  mul x4,x21,x22          // the values in the x21,x22 are multiplied and the result is placed into the reg x4

  TEST_PASSFAIL           // Checks the test is pass or fail

RVTEST_CODE_END           // end of the code section

  .data                   // input the test data

RVTEST_DATA_BEGIN         // beginning of the data section
  TEST_DATA

inp_data:
  .word 0x06627912        // memory address 8000_2000
  .word 0x06627912        // 8000_2004
  .word 0x584944fc        // 8000_2008
  .word 0x584944fc        // 8000_200c
  .word 0x558f5366        // 8000_2010
  .word 0x558f5366        // 8000_2014
  .word 0x29df2fb1        // 8000_2018
  .word 0x29df2fb1        // 8000_201c
  .word 0x40053e92        // 8000_2020
  .word 0x40053e92        // 8000_2024
  .word 0x17010699        // 8000_2028
  .word 0x17010699        // 8000_202c
  .word 0x594b9169        // 8000_2030
  .word 0x594b9169        // 8000_2034
  .word 0x64cd11c7        // 8000_2038
  .word 0x64cd11c7        // 8000_203c
  .word 0x6133a31e        // 8000_2040
  .word 0x6133a31e        // 8000_2044
  .word 0x2a9e3a3d        // 8000_2048
  .word 0x2a9e3a3d        // 8000_204c
  .word 0x59f86117        // 8000_2050
  .word 0x59f86117        // 8000_2054
  .word 0x39214611        // 8000_2058
  .word 0x39214611        // 8000_205c
  .word 0x6ec633f5        // 8000_2060
  .word 0x6ec633f5        // 8000_2064
  .word 0x4910a7b3        // 8000_2068
  .word 0x4910a7b3        // 8000_206c
  .word 0x3392ec72        // 8000_2070
  .word 0x3392ec72        // 8000_2074
RVTEST_DATA_END           // end of the data section

