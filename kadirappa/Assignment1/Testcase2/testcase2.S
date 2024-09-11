//**********************************************************************
//    Originator: Kadirappa
//    assignment : 1
//    question no : 2 
//    Born-on Date: 29-10-2024
//**********************************************************************
//    Description: Back to Back store
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li gp, 3
// Register to Memory 
test1:
 // andi x6,x6,0
  //andi x7,x7,0
  la x6,inp_data
  la x18,inp_data
  li x7,0x06627918
  sb x7,0(x6)
  sh x7,4(x6)
  sw x7,8(x6)
  sd x7,0(x6)
  
  TEST_PASSFAIL

RVTEST_CODE_END  

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:

  .word 0x06627918  //80002000
  .word 0x06627912  //80002004=12 | 80002005=79 | 80002006=62 | 80002007=06 
  .word 0x584944fc  //80002008=fc | 80002009=44 | 8000200a=49 | 80002010=58 
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
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


