#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

# switch from machine mode to supervisor mode

START:
   li gp, 3			# initialize gp
   la x12, inp_data		
   lw x13, 0(x12)		# x13 = 0x06627912
   
   li x6, 0x800			# 1000 0000 0000
   csrw mstatus, x6       	# write the value of x6 into mstatus register
   
   la x7, smode             	# load the addr of smode into x7
   csrw mepc, x7		# stores the address to mepc
   
   csrr x8, mstatus    	        # read the value of mstatus into x8
    mret			# returns to add stored in x7


smode:
    add x9, x6, x13            
    
    li x10, 0
    csrw sstatus, x10		# write the value of x10 into mstatus register

    la x11, umode		# load the addr of smode into x11
    csrw sepc, x11		# stores the address to sepc
   
    csrr x14, sstatus		# read the value of sstatus into x14
    sret

umode:
    add x9, x6, x13
    
    nop

TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
RVTEST_DATA_END
