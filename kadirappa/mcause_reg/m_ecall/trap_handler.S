//**********************************************************************
//    Originator: kadirappa
//    assignment : 
//    question no : 1 
//    Born-on Date: 12-11-2024
//**********************************************************************
//    Description: Write a code to jump to trap_handler and return to main mode
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

instr_block:
  li x7,2
  li x8,4
  add x10,x8,x2
  sub x10,x8,x2
  mul x10,x8,x2
  ecall
  div x10,x8,x2
  and x10,x8,x2
  or x10,x8,x2
  xor x10,x8,x2
  
exit:nop

  TEST_PASSFAIL
RVTEST_CODE_END

trap_handler:

  csrr x12,mtval
  csrr x13,mcause
  csrr x11,mepc
  addi x11,x11,4
  csrw mepc,x11
  mret


//RVTEST_CODE_END

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







