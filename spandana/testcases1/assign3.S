# See LICENSE.vyoma for more details 

#include "test_macros.h"	#includes "test_macros.h" header file
#include "riscv_test.h"		#includes "riscv_test.h" header file

RVTEST_RV32U			#sets up a 64bit user mode 		
RVTEST_CODE_BEGIN		#beginning of the test code		

#Unconditional Jumps (jal with rd = x0) with targets in  +/- 1 MB straight line code (no loops) both for compressed and non-compressed

START:
    li gp, 3		#load immediate value 3 into gp(x3)	
    li x4,20		#load x3 with 20
    add x5,x4,x4 
          
    
#non-compressed uncond jump
    
    jal x0, target_label1	# uncond Jump to target_label #rd=x0 means no link/register storage of the return address
    .align 20
     li x1, 1            	# Load immediate value 1 into x1 (not executed)
   
target_label1:
    li x2, 2           		# Load immediate value 2 into x2
    
    li a7, 10                   # System call number for exit
    ecall 

/*#compressed uncond jump
    
    C.j target_label2	        # uncond Jump to target_label
    C.li x1, 1            	# Load immediate value 1 into x1 (not executed)
   
target_label2:
    C.li x2, 2                  # Load immediate value 2 into x2
    
    C.li a7, 10                 # System call number for exit
    ecall */


  TEST_PASSFAIL			#checks for pass or fail

RVTEST_CODE_END                 #end of test code

  .data				#defines the data used for loads in testcase

RVTEST_DATA_BEGIN               #beginning of data section
  TEST_DATA


inp_data:
  .word 0x06627912		#80002000
  .word 0x06627912              #80002004
  .word 0x584944fc              #80002008
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

RVTEST_DATA_END			#end of data section	

