# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U        # 32-bit RISC-V user mode 
RVTEST_CODE_BEGIN   # beginning of the test code section


  li gp, 3
  li x1, 20

#Conditional Branches in straight line code (no loops) both for compressed and non-compressed

  # Addresses for test data 
  li x12, 8         #load immediate value 8 to x12 
  li x13, 21        #load immediate value 21 to x13 
  add x11, x12, x13 #x11=x12+x13
  li x14, 18 	


#Non-compressed conditional branches

equal:
  add x14, x14,1   #x14=x14+1=19
  beq x11, x14, GO #branches to GO if x11=x14

not_equal:
  bne x13, x1, end #branches to end if x13 != x14
  
greater_than:
  li x5, 12    
  bge x5, x12, GO   #branches to GO if x5>x12

less_than:
  li x6, 12
  blt x6, x14, end  #branches to end if x6<x14

#Compressed conditional branches

comp_branch:
 li x12, 2
 c.bnez x12, GO    #branches to go if x12!=0
 c.beqz x12, end   #branches to end if x12=0

GO: andi x16, x12, 7

end: li x10,5

  TEST_PASSFAIL   # Checks if the test passed or failed

RVTEST_CODE_END   #end of test code section


  .data            #beginning of data section
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

RVTEST_DATA_END     #end of data section




