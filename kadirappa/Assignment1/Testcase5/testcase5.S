//**********************************************************************
//    Originator: Kadirappa
//    assignment : 1
//    question no : 5 
//    Born-on Date: 29-10-2024
//**********************************************************************
//    Description: Load Overlap
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN
 
li gp, 3

//Loading input data to registers from 80002000 to etc Address 
  la x6,inp_data
  la x7,inp_data
  la x28,inp_data
  la x29,inp_data  


test1:
  // loading 8-bit value
  ld x18,0(x6)
  lw x18,4(x6)
  lh x18,2(x6)
  lb x18,0(x6)

test2:
  lh x19,2(x7)
  //lh x20,3(x7)  ////Address is overlapping 
  lh x20,2(x7)

  
  lw x19,4(x7)
  lw x20,5(x7)
  //lw x20,4(x7)  //Address is overlapping 

  
  ld x19,8(x7)
  ld x20,8(x7)

    
  TEST_PASSFAIL

RVTEST_CODE_END  

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x06627918  
  .word 0x06627912   
  .word 0x584944fc  
  .word 0x584944fc  
  .word 0x558f5366  
  .word 0x558f5366  
  .word 0x29df2fb
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




