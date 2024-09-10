# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

# Set up some registers for demonstration
li gp, 3
la x1, inp_data

machine_mode:

  la x5, 10           # Load address 10 into x5
  lw x6, 8(x1)        # Load word from address (x1 + 8) into x6
  csrr x8,mstatus

  # Set MPP to Supervisor mode (01)
  li x7, 0x800       # Load the value 0x800 into x7 to set MPP bits (bits 11 and 12) to 01
  csrs mstatus, x7    # Set MPP bits in MSTATUS using CSRS with x7
 
  csrr x9,mstatus
  addi x17, gp, 1     
  
  la x15, switch_to_smode
  csrw mepc,x15              # stores the address to mepc(mret will return to this address)
 
  mret                # Return to Supervisor mode

switch_to_smode:
  nop
  nop
  li x10,0x0000
  csrs sstatus, x10   #spp bit in sstatus csr is 0 (U mode)
 
  la x16, switch_to_umode
  csrw  sepc, x16         #loads sepc with address stored in x16

  sret           #returns to user mode and starts executing from the address in sepc
  
  nop                 # No operation (place-holder for next instruction)
  
switch_to_umode:
nop
nop

TEST_PASSFAIL
RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
  .word 6
  .word 7
RVTEST_DATA_END






