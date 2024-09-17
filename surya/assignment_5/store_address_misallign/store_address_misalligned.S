//**********************************************************************
//    Originator: Surya
//    assignment : 5
//    question no : 3 
//    Born-on Date: 12-09-2024
//**********************************************************************
//    Description: store address misaligned
//**********************************************************************


# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

    li gp, 3
    li x20, 4
    li x21, 5
    la x10,inp_data
    la x9, store_trap_handler
    csrw mtvec, x9
    
store_test:

    addi x2,x11,5
    sw x2,0(x10)
    addi x12,x0,10
    or x13,x12,x2
    sw x13,1(x10)
    and x14,x20,x21
    xor x15,x20,x21    
    
exit:
    nop

  TEST_PASSFAIL
  
store_trap_handler : 
  csrr x7,mcause
  csrr x6,mepc
  addi x6,x6,4
  csrw mepc,x6
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












