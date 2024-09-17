//**********************************************************************
//    Originator: Surya
//    assignment : 5
//    question no : 4 
//    Born-on Date: 12-09-2024
//**********************************************************************
//    Description: AMO address misaligned
//**********************************************************************


# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

    li gp, 3
    li x4, 4
    li x21, 5
    la x10,inp_data
    addi x10,x10,3
    la x9, amo_trap_handler
    csrw mtvec, x9
    
amo_test:
  sw x21,0(x10)
min:
  amomin.w x4,x4,0(x10)
  amominu.w x15,x4,0(x10)
add:
  amoadd.w x20,x4,0(x10)
swap :
  amoswap.w x11,x4,0(x10)
binary_op:
  amoand.w x12,x4,0(x10)
  amoor.w x13,x4,0(x10)
  amoxor.w x14,x4,0(x10)
max:
  amomax.w x17,x4,0(x10)
  amomaxu.w x18,x4,0(x10)
    
exit:
    nop

  TEST_PASSFAIL
  
amo_trap_handler : 
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












