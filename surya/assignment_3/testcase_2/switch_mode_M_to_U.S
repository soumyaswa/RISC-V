//**********************************************************************
//    Originator: Surya
//    assignment : 2
//    question no : 1 
//    Born-on Date: 04-09-2024
//**********************************************************************
//    Description: Switch mode from machine to user mode
//**********************************************************************


# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

  li gp,3
  
m_mode :
  
  la x6, 0x0
  la x2,inp_data
  la x4,inp_data
    
  csrs mstatus, x6                 // load the value 0 to mstatus, mpp is 00
  csrr x7,mstatus
  
  add x9,x2,x4
  sub x10,x4,x2
  
  la x11,u_mode
  csrw mepc,x11                    // load the address of u_mode into mepc 
  mret                             // return to user mode
  
u_mode:

  addi x1,x0,10

f_basic:

   flw f0,8(x2)
   flw f1,4(x2)
   
   fadd.s f5,f0,f1
   fsub.s f6,f0,f1
   fmul.s f7,f0,f1
   fdiv.s f8, f0,f1
   fsqrt.s f4, f1


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
