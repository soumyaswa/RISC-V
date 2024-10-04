//**********************************************************************
//    Originator: kadirappa
//    assignment : 5
//    question no : 1 
//    Born-on Date: 16-10-2024
//**********************************************************************
//    Description: Load address misaligned 
//**********************************************************************

# See LICENSE.vyoma for more details  

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

lable1:
  la x6,trap_handler
  csrw mtvec,x6

 // Loading 16-bit value
  la x6,inp_data
  la x7,inp_data
  la x28,inp_data
  la x29,inp_data
  lh x18,8(x6)
  lh x18,9(x7)
  lh x18,16(x28)
  lh x18,20(x29) 
  li x19,2
  li x20,4
  mul x21, x20,x19


  TEST_PASSFAIL

trap_handler:

 
  csrr x22,mcause
  csrr x28,mepc
  addi x28,x28,4
  csrw mepc,x28
  mret

  


RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
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








