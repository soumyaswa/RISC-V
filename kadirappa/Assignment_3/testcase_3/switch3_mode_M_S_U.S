//**********************************************************************
//    Originator: Kadirappa
//    assignment : 3
//    question no : 3 
//    Born-on Date: 10-09-2024
//**********************************************************************
//    Description: Switching Machine mode to Supervisor to User mode
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

lable1:
  //Loading input data address into regs
  la x2,inp_data
  la x3,inp_data
  la x18,inp_data
  
  li x10,0x1104
  csrw misa,x10
  csrr x20,misa
   //csrc misa,x0

  li x6,0x800
  csrs mstatus,x6
  csrr x7,mstatus

  csrr x7,mepc
  
  add x4,x2,x3
  sub x4,x4,x3
  mul x4,x2,x3
  div x19,x4,x2
  rem x19,x4,x2 

  la x7,l2
  csrw mepc,x7
  mret


l2:
  li x20,6
  li x21,8  
  li x6,0x000
  csrs sstatus,x6
  csrr x7,sstatus

  or x22,x20,x21
  xor x22,x20,x21
  and x22,x20,x21
  
  srli x20,x20,1
  slli x21,x21,2
  
  csrr x7,sepc
  la x7,l3
  csrw sepc,x7
  sret

l3:
  la x18,inp_data
  la x19,inp_data
 
  andi x20,x18,5
  c.add x20,x18
  
  //fmadd.s x20,x18,x18,x19
  /*flw f20,4(x18)
  flw f21,8(x19)
  fadd.s f23,f20,f21
  fsub.s f23,f23,f20
  */




  TEST_PASSFAIL

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




