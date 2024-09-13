//**********************************************************************
//    Originator: Surya
//    assignment : 4
//    question no : 4 
//    Born-on Date: 12-09-2024
//**********************************************************************
//    Description: Write code to jump to trap_handler and return to main code
//**********************************************************************


# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x2, 4
  li x4, 5
  la x6, trap_handler
  csrw mtvec, x6
   
test:

  add x7,x2,x4
  sub x8,x4,x2
  mul x9, x2,x7
  div x10,x9,x7
  ecall
  slli x11,x2,1
  and x12,x2,x4
  ori x13,x2,5
  xor x14, x2,x4
  
exit :
  nop

  TEST_PASSFAIL
  
RVTEST_CODE_END

trap_handler : 
  csrr x6,mepc
  addi x6,x6,4
  csrw mepc,x6
  mret
  
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












