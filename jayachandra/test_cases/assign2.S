# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3

#Non-Compressed (32-bit) Conditional Branches

Non_compressed:
    li t0, 5           
    li t1, 10         

    beq t0, t1, equal  
                       # Code if t0 != t1
    li a0, 1           
    j end             

equal:
    li a0, 2           
end:
    li a7, 10          
    ecall

#Compressed (16-bit) Conditional Branches

compressed:
    c.li x12, 5          
    c.li x15, 10        
    c.beqz x12,zero   # Branch to 'zero' if t0 == 0

                       # Code if t0 != 0
    c.li x16, 1          
    c.j end1             

zero:
    c.li x17, 2           
end1:
                       
    c.li x18, 10          
    ecall

 

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




