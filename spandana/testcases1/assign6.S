# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN
 
# Conditional Branches in loops . nested for loops with varying nesting depth (1 to 8)
    
    li gp,3 
    li x1, 0         # Loop1 counter
    li x2, 1         # Loop1 limit
    li x17,10

loop1:
    bge x1, x2, end1
    li x3, 0         # Loop2 counter
    li x4, 1         # Loop2 limit

loop2:
    bge x3, x4, end2
    li x5, 0         # Loop3 counter
    li x6, 1         # Loop3 limit

loop3:
    bge x5, x6, end3
    li x7, 0         # Loop4 counter
    li x8, 1         # Loop4 limit

loop4:
    bge x7, x8, end4
    li x9, 0         # Loop5 counter
    li x10, 1        # Loop5 limit

loop5:
    bge x9, x10, end5
    li x11, 0        # Loop6 counter
    li x12, 1        # Loop6 limit

loop6:
    bge x11, x12, end6
    li x13, 0        # Loop7 counter
    li x14, 1        # Loop7 limit

loop7:
    bge x13, x14, end7
    li x15, 0        # Loop8 counter
    li x16, 1        # Loop8 limit

loop8:
    bge x15, x16, end8
    addi x15, x15, 1 	        # Increment Loop8 counter
    bne x15, x17, loop8       	# Repeat Loop8 

end8:
    addi x13, x13, 1 		# Increment Loop7 counter
    bne x13, x17, loop7    	# Repeat Loop7 

end7:
    addi x11, x11, 1 		# Increment Loop6 counter
    bne x11, x17, loop6	    	# Repeat Loop6 

end6:
    addi x9, x9, 1  		# Increment Loop5 counter
    bne x9, x17, loop5	   	# Repeat Loop5 

end5:
    addi x7, x7, 1  		# Increment Loop4 counter
    bne x7, x17, loop4      	# Repeat Loop4 

end4:
    addi x5, x5, 1  		# Increment Loop3 counter
    bne x5, x17, loop3	   	# Repeat Loop3 

end3:
    addi x3, x3, 1 		# Increment Loop2 counter
    bne x3, x17, loop2      	# Repeat Loop2 

end2:
    addi x1, x1, 1  		# Increment Loop1 counter
    bne x1, x17, loop1     	# Repeat Loop1 

end1:
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
