//**********************************************************************
//    Originator: kadirappa
//    assignment : 4
//    question no : 2 
//    Born-on Date: 12-09-2024
//**********************************************************************
//    Description: Zicsr instructions testing with mscratch
//**********************************************************************

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

csrrw_l1:
  csrr x8,mscratch      //Initially mscratch value x8=0
  li x6,32
  csrrw x7,mscratch,x6  // x7=0 | mscratch=32
  //csrrw x0,mscratch,x6  //If we use x0 in rd, read operation is not done
  beq x8,x7,csrrs_l2
  add x6,x8,x1

csrrs_l2:
  la x8,inp_data          //80002000
  lw x9,0(x8)             //0x06627912
  lw x18,8(x8)
  li x6,1
  csrw mscratch,x9        //mscratch=06627912
  csrrs x10,mscratch,x18   //x10 reg read value from mscratch and, Set--> mscartch= x18 | mscratch (Bitwise OR operation)
  //csrrs x10,mscratch,x0  //If we use x0 in rs, write operation is not done
  beq x10,x9,csrrc_l3
  sub x10,x9,x9

csrrc_l3:
  la x11,inp_data
  lw x12,8(x11)
  li x6,15
  csrw mscratch,x12
  csrrc x13,mscratch,x12   //x13 reg read value from mscratch and,in case of clear x12 reg cleared
  //csrrc c13,mscratch,x0 //If we use x0 in rs, write operation is not done
  beq x13,x12,csrrwi_l4
  mul x6,x8,x1

csrrwi_l4:
  la x8,inp_data
  lw x9,16(x8)
  csrw mscratch,x9
  csrrwi x10,mscratch,2   ////x10 reg read value from mscratch and | mscratch=2
  //csrrwi x0,mscratch,2  //If we use x0 in rd, read operation is not done
  beq x10,x9,csrrsi_l5
  srli x1,x1,2
 
csrrsi_l5:
  la x8,inp_data
  lw x9,24(x8)
  csrw mscratch,x9
  csrrsi x10,mscratch,4    //x10 reg read value from mscratch and , Set--> mascratch= 4 | mscratch(birwise OR operation)
  //csrrsi x10,mscratch,0  //If we use 0 in rs, write operation is not done
  beq x10,x9,csrrci_l6
  and x10,x9,x8
 
csrrci_l6:
  la x11,inp_data
  lw x12,32(x11)
  csrw mscratch,x12
  csrrci x13,mscratch,6    //x13 reg read value from mscratch and,in case of clear the first bit of mscratch is set to 0
  //csrrsi x13,mscratch,0  //If we use 0 in rs, write operation is not done

  

  
  
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






