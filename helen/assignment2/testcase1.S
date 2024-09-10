# See LICENSE.vyoma for more details 

#include "test_macros.h"   #includes the header files
#include "riscv_test.h"

RVTEST_RV64U  # 64-bit RISC-V user mode 
RVTEST_CODE_BEGIN  # beginning of the test code section

#RAW,WAR,WAW Hazard


la x5,inp_data #loads the address of inp_data (80002000) into x5

#li x10, 0x80002004
#lw x12,0(x10)


RAW:
li x2, 10    #loads immediate value 10 to x2
sw x2, 4(x5) #stores value in x2 (10) to memory address x5+4 (80002004)
lw x3, 4(x5) #loads value in x5+4 to x3


WAR:
lw x2, 12(x5)  #loads value in x5+12 (8000200c) to x2
li x4, 15     #loads immediate value 15 to x4 
sw x4, 12(x5)  #stores value in x4 (15) to memory address x5+4 (8000200c)


WAW:
li x2, 10        #loads immediate value 10 to x2
sw x2, 4(x5)     #stores value in x2 (10) to memory address x5+4 (80002004)
li x4, 15        #loads immediate value 15 to x4 
sw x4, 4(x5)     #stores value in x4 (15) to memory address x5+4 (80002004)


   TEST_PASSFAIL  # Checks if the test passed or failed

RVTEST_CODE_END  # end of the test code section

  .data # beginning of the data section

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

RVTEST_DATA_END  # end of the test data section













