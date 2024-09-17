
# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test:
 la x5,trap_handler
 csrw mtvec,x5
 
 csrr x13,mstatus
 li x12,0x800
 csrw mstatus,x12
 
 
la x15,inp_data
la x16,inp_data
lw x6,0(x15) 
lw x7,4(x15)
lw x8,8(x15)
lw x10,16(x15)
lw x11,18(x15)
   
trap_handler:

la x1, input                     # allocate stack space
    sw x12, 0(x1)      				  # save x12
    sw x13, 4(x1)      				  # save x13
    sw x14, 8(x1)      				  # save x14
    sw x15, 12(x1)     				  # save x15
    sw x16, 16(x1)     				  # save x16
    sw x17, 20(x1)    				  # save x17
    sw x18, 24(x1)     				  # save x18
    sw x19, 28(x1)                                # save x19
 
  
    csrr x12, mcause                              # Read the mcause CSR into x12
    csrr x13, mepc                                # Read the mepc CSR into x13
 
   
    li x14, 4          		                  # mcause = 0
    bne x12, x14, done                            # if mcause != 0, skip
 
    
    la x14,loop
    csrw mepc, x14                                # update mepc with fixed instruction address
 
done:
    lw x12, 0(x1)      				   # restore x12
    lw x13, 4(x1)      				   # restore x13
    lw x14, 8(x1)      				   # restore x14
    lw x15, 12(x1)   				     # restore x15
    lw x16, 16(x1)     				   # restore x16
    lw x17, 20(x1)                                 # restore x17
    lw x18, 24(x1)                                 # restore x18
    lw x19, 28(x1)                                 # restore x19
    la x1,input                       # deallocate stack space
 
   
    mret 
loop:
add x15,x15,1
    
    
  TEST_PASSFAIL


RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA
input:
  .word 0x28cb8c74
  .word 0x28cb8c74

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