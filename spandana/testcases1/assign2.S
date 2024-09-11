# See LICENSE.vyoma for more details 

#include "test_macros.h"	#includes "test_macros.h" header file
#include "riscv_test.h"		#includes "riscv_test.h" header file

RVTEST_RV64U		#sets up a 64bit user mode 
RVTEST_CODE_BEGIN	#beginning of the test code	

  li gp, 3	#load immediate value 3 into gp(x3)
  
  li x4,0x80002004	#to check whether the inp_data is present in the expected add or not
  lw x12,0(x4)

#Non-Compressed Conditional Branches
#they use 32bit (4 byte) instructions

/*Non_compressed:
    li x0, 5     #Load immediate value 5 into x0   
    li x1, 10    #Load immediate value 10 into register x1    

    beq x0, x1, equal  #Branch to 'equal' if x0 == x1
                       
    li a0, 1     #if branch is not taken      
    j end        #jump to end    

equal:  	#if branch is taken	
    li a0, 2 
          
end:		
    li a7, 10          
    ecall*/

#Compressed Conditional Branches 
#they use 16bit (2 byte) instructions to reduce code size, improve cache efficiency, reduce memory usage ..

compressed:
    c.li x12, 5          
    c.li x15, 10        
    c.beqz x12,zero   # Branch to 'zero' if x12 == 0

                       
    c.li x16, 1      #if branch is not taken     
    c.j end1         #jump to end1    

zero:		   #if branch is taken
    c.li x17, 2           
end1:
                       
    c.li x18, 10          
    ecall

 

  TEST_PASSFAIL		#checks for pass or fail

RVTEST_CODE_END		#end of test code

  .data			#defines the data used for loads in testcase

RVTEST_DATA_BEGIN	#beginning of data section
  TEST_DATA


inp_data:
  .word 0x06627912	#80002000
  .word 0x06627912	#80002004
  .word 0x584944fc	#80002008
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

RVTEST_DATA_END	 	#end of data section	




