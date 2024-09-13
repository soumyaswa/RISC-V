//**********************************************************************
//    Originator: Surya
//    assignment : 4
//    question no : 3 
//    Born-on Date: 12-09-2024
//**********************************************************************
//    Description: Zicsr instructions testing with mscratch.
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN
  
  li gp,3
  la x8, inp_data
  lw x9, 4(x8)          	        
 
 
CSRRW_test:
   csrrw x2, mscratch, x9
   beq x2, x9, csrrw_fail
 
CSRRS_test:
   li x4, 0x89ABCDEF
   csrrs x5, mscratch, x4
   beq x5, x4, csrrs_fail
 
CSRRC_test:
   li x6, 0xffff0000
   csrrc x7, mscratch, x6
   beq x7, x6, csrrc_fail
 
CSRRWI_test:
   li x7, 0xffffffff
   csrrwi x8, mscratch, 10
   beq x8, x7, csrrwi_fail
 
CSRRSI_test:
   li x9, 0x0000ffff
   csrrsi x10, mscratch, 11
   beq x10, x9, csrrsi_fail
 
CSRRCI_test:
   li x11, 0x0f0f0f0f
   csrrci x12, mscratch, 12
   beq x12, x11, csrrci_fail
 
PASS:
   nop 
   j exit
 
csrrw_fail:
   addi x2,x2,100
   j CSRRS_test
 
csrrs_fail:
   andi x5,x5,5 
   j CSRRC_test
 
csrrc_fail:
   ori x7,x6,45
   j CSRRWI_test
 
csrrwi_fail:
   xor  x8,x7,x9
   j CSRRSI_test
 
csrrsi_fail:
   sub x15,x9,x7
  j CSRRCI_test
 
csrrci_fail:
   mul x13,x11,x0
  j exit
 
exit:
    nop

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
