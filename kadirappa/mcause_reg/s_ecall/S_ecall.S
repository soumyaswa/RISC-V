//**********************************************************************
//    Originator: Kadirappa
//    assignment : 3
//    question no : 1 
//    Born-on Date: 10-09-2024
//**********************************************************************
//    Description: Switching Machine mode to Supervisor mode
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

lable1:
  li x2,2
  li x3,4
  la x18,inp_data

  la x28,trap_handler
  csrw mtvec,x28

  li x6,0x800       //800 is the Value to set S-mode in mstatus-mpp field
  csrs mstatus,x6  //Set the value in mstatus
  csrr x7,mstatus  //Reading the mstatus reg

  csrr x19,mcycle
  csrr x20,minstret

  csrr x7,mepc     //reading the mepc reg
  
  slli x2,x2,2
  srli x3,x3,1
  add x18,x2,x3
  sub x18,x3,x2
  mul x18,x3,x2
  //csrr x19,mcycle


  la x7,l2        //Loading the address of S-mode entry in x7
  csrw mepc,x7   //Write the S-mode address in mepc
  mret
  

l2:
  add x4,x3,x2
  c.add x3,x2
  ecall
  and x4,x3,x2
  mul x4,x3,x2
    

  TEST_PASSFAIL

RVTEST_CODE_END

trap_handler:
	csrr x12,mtval
	csrr x13,mcause
	csrr x14,mepc
	addi x14,x14,4
	csrw mepc,x14
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



