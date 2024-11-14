# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
  li gp, 3
  
  # Addresses for test data
 	la x31, inp_data 
 	la x6,trap_handler
	csrw mtvec,x6
test:
	lw x20,0(x31)
	lw x4,3(x31)      //load_address_misaligned
	add x7,x20,x4     
	sw x10,6(x31)     //Store_address_missaligned
	sub x31,x10,x20
	ecall             //ecall
  lw x12,0(x30)     //Load access fault
  addi x7,x20,4
  sw x7, -4(x31)    //store access fault
  add x7,x20,x4
  jalr x1,0(x30)    //instruction access fault
  add x7,x20,x4
 
exit:
nop
  
  TEST_PASSFAIL
RVTEST_CODE_END

trap_handler:
csrr x10,mcause
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

