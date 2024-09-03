# See LICENSE.vyoma for more details
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32U
RVTEST_CODE_BEGIN
 
  li gp, 3
 
#Non-Compressed Conditional Branches
 
Non_compressed:
  li x1, 8 
  li x2, 20
  li x4,0
  add x11, x1, x2
  li x14, 27      
 
equal:
  add x14, x14,1
  beq x11, x14, exit
 
not_equal:
  bne x2, x1, Go
  
greater_than:
  li x5, 12
  bge x5, x1, exit
 
less_than:
  li x6, 2
  bge x6, x14, end        
 
exit:
    addi x4,x4,1         
Go:
    li x6, 10          
    
 
#Compressed Conditional Branches
 
 compressed:
    c.li x10, 5          
    c.bnez x10,zero  
    c.beqz x10,end
    
    c.li x9, 1          
 
zero:
    c.li x9, 2           
end:
    c.li x5, 10          

 
 
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