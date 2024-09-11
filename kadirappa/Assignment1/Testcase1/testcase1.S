//**********************************************************************
//    Originator: Kadirappa
//    assignment : 1
//    question no : 1 
//    Born-on Date: 29-10-2024
//**********************************************************************
//    Description: Back to Back load
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3

  /*li x6,100
  li x6,0x8000*/
  
  /*li x6,0X8000
  li x7,0x1234
  li x28,0x8001*/


  //Loading input data to registers from 80002000 to etc Address 
  la x6,inp_data
  la x7,inp_data
  la x28,inp_data
  la x29,inp_data  


test1:
  // loading 8-bit value
  lb x18,0(x6)
  lb x18,4(x7)
  lb x18,2(x28)
  lb x18,3(x29)
  
  // Loading 16-bit value
  lh x18,8(x6)
  lh x18,12(x7)
  lh x18,16(x28)
  lh x18,20(x29)  
  
  // loading 32-bit value
  lw x18,0(x6)
  lw x18,4(x7)
  lw x18,8(x28)
  lw x18,12(x29) 

  // Loading 64-bit value
  ld x18,0(x6)
  ld x18,8(x7)
  ld x18,16(x28)
  ld x18,24(x29) 

  
  TEST_PASSFAIL

RVTEST_CODE_END  

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
.dword 0x06627918  //80002000
  .dword 0x06627912  //80002004=12 | 80002005=79 | 80002006=62 | 80002007=06 
  .dword 0x584944fc  //80002008=fc | 80002009=44 | 8000200a=49 | 80002010=58 
  .dword 0x584944fc  //8000200e=5849 
  .dword 0x558f5366  //80002012=558f
  .dword 0x558f5366  //80002016=558f
  .dword 0x29df2fb1  //8000201a=29df
  .dword 0x29df2fb1  
/*  .word 0x06627918  //80002000
  .word 0x06627912  //80002004=12 | 80002005=79 | 80002006=62 | 80002007=06 
  .word 0x584944fc  //80002008=fc | 80002009=44 | 8000200a=49 | 80002010=58 
  .word 0x584944fc  //8000200e=5849 
  .word 0x558f5366  //80002012=558f
  .word 0x558f5366  //80002016=558f
  .word 0x29df2fb1  //8000201a=29df
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
  .word 0x28cb8c74   */

RVTEST_DATA_END

