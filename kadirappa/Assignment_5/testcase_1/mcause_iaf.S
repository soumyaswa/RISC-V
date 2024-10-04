//**********************************************************************
//    Originator: kadirappa
//    assignment : 6
//    question no : 1 
//    Born-on Date: 18-09-2024
//**********************************************************************
//    Description: Instruction access fault 
//**********************************************************************

# See LICENSE.vyoma for more details  

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  //li x1, 20

/*
lable1:
  la x6,trap_handler
  csrw mtvec,x6
*/
lable2:

  csrw pmpcfg0,x0 //initialize the reg
  li x24,0x0f  //0001_1011 --> Execution field disabled
  csrw pmpcfg0,x24  //writing x24 reg value into pmpcfg0 reg
  
  li x25,0x80000000
  srli x25,x25,2
  ori x25,x25,0
  csrw pmpaddr0,x25
  
  li x8,2
  li x9,4
  add x9,x9,x8
  addi x9,x8,12

.align 2
inst_access_fault:
  li x6,12
  ret
  mul x10,x9,x8

  TEST_PASSFAIL
/*
trap_handler:
  csrr x22,mcause
  csrr x28,mepc
  addi x28,x28,4
  csrw mepc,x28
  mret
*/
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









