# See LICENSE.vyoma for more details
#include "test_macros.h"		
#include "riscv_test.h"			
RVTEST_RV64UF				# sets up a 64bit user mode 
RVTEST_CODE_BEGIN			# beginning of the test code

# One Loop with varying number of instructions inside the loop. number of instructions varying from 1 to 64
    li gp,3 
    li x7, 0        			# Loop counter
    li x1, 10       			# Loop limit (number of iterations)

loop:
    bge x7, x1, exit  			# If x7>= x1, exit the loop

    .rept 2				# Start of loop body with i extension
    li x1, 10        			# Load immediate value 10 into x1
    li x2, 20        			# Load immediate value 20 into x2
    add x3, x1, x2  		        # Add x1 and x2, store result in x3
    sub x4, x1, x2   			# Subtract x2 from x1, store result in x4
    mul x5, x1, x2   			# Multiply x1 and x2, store result in x5
    div x6, x2, x1   			# Divide x2 by x1, store result in x6
    .endr

   .rept 2				# Start of loop body with f extension
    la x8, inp_data
    lw x9, 4(x8)
    fmv.s.x f1, x8
    fmv.s.x f2, x9
    fadd.s f3, f1, f2     		# Add f1 and f2, store result in f3
    fsub.s f4, f1, f2     		# Subtract f2 from f1 , store result in f4
    fmul.s f5, f1, f2     		# Multiply f1 and f2, store result in f5
    fdiv.s f6, f1, f2			# Divide f1 by f2 , store result in f6
    .endr

    .rept 2				# Start of loop body with m extension
    li x1, 15        			# Load immediate value 15 into x1
    li x2, 5	         		# Load immediate value 5 into x2
    mul x3, x1, x2			# Multiply x1 and x2, store result in x3
    div x4, x1, x2   			# Divide x1 by x2, store result in x4
    rem x5, x1, x2   			# Remainder of x1 divided by x2, store result in x5
    .endr

    .rept 2
    la x8, inp_data
    lw x9, 4(x8)
    fmv.d.x f1, x8
    fmv.d.x f2, x9
    fadd.d f3, f1, f2     		# Add d1 and d2 , store result in d3
    fsub.d f4, f1, f2     		# Subtract d2 from d1 , store result in d4
    fmul.d f5, f1, f2     		# Multiply d1 and d2, store result in d5
    fdiv.d f6, f1, f2     		# Divide d1 by d2 , store result in d6
    .endr

    addi x7, x7, 1   			# Increment loop counter
    j loop          		        # Repeat loop

exit:
    nop


  TEST_PASSFAIL			       #checks for pass or fail		
 
RVTEST_CODE_END       		       #end of test code
 
  .data				       #defines the data used for loads in testcase
 
RVTEST_DATA_BEGIN	               #beginning of data section
  TEST_DATA
 
 
inp_data:
  .float 1.5            		#80002000
  .word 0x06627912	 		#80002004
  .word 0x584944fc	 		#80002008
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
 
RVTEST_DATA_END				#end of data section