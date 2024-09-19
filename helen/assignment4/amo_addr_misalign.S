# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

    li gp, 3
    addi x16, x16, 4
    li x12, 5
    la x15,inp_data
    
    la x10, trap_handler
    csrw mtvec, x10
    
amo_test:
  li x15,1
  
  amomin.w x16,x16,0(x15)
  
  

  amomax.w x8,x16,0(x15)
  
  amoadd.w x9,x16,0(x15)

  amoand.w x11,x16,0(x15)
  
  amoor.w x12,x16,0(x15)
  
  amoxor.w x13,x16,0(x15)
  
  amoswap.w x14,x16,0(x15)



exit:
    nop

  TEST_PASSFAIL
  
trap_handler : 
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

