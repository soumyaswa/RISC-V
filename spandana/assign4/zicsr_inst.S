# See LICENSE.vyoma for more details 
#include "test_macros.h"		
#include "riscv_test.h"			
RVTEST_RV64M				#sets up a 64bit user mode 
RVTEST_CODE_BEGIN			#beginning of the test code

START:
  li gp, 3
  la x8, inp_data
  lw x9, 0(x8)          	        # x9=0x06627912  
  csrw mscratch, x9                     

Test_CSRRW:
   csrrw x2, mscratch, x9               
   bne x2, x1, fail_csrrw

Test_CSRRS:
   li x4, 0x0000FFFF
   csrrs x5, mscratch, x4
   bne x5, x4, fail_csrrs

Test_CSRRC:
   li x6, 0xFFFF0000
   csrrc x7, mscratch, x6
   bne x5, x4, fail_csrrc

Test_CSRRWI:
   li x7, 0x87654321
   csrrwi x8, mscratch, 12
   bne x8, x7, fail_csrrwi

Test_CSRRSI:
   li x9, 0x0000FFFF
   csrrsi x10, mscratch, 16
   bne x10, x9, fail_csrrsi

Test_CSRRCI:
   li x11, 0xFFFF0000
   csrrci x12, mscratch, 22
   bne x12, x11, fail_csrrci

PASS:
   li x13, 0
   j exit

fail_csrrw:
   li x13, 1
   j Test_CSRRS

fail_csrrs:
   li x13, 2
   j Test_CSRRC

fail_csrrc:
   li x13, 3
   j Test_CSRRWI

fail_csrrwi:
   li x13, 4
   j Test_CSRRSI

fail_csrrsi:
  li x13, 5
  j Test_CSRRCI

fail_csrrci:
li x13, 6
j exit

exit:
    nop


TEST_PASSFAIL				#checks for pass or fail		
 
RVTEST_CODE_END         		#end of test code
 
  .data					#defines the data used for loads in testcase
 
RVTEST_DATA_BEGIN			#beginning of data section
  TEST_DATA
 
 
inp_data:
  .word 0x06627912       		#80002000
  .word 0x06627912	 		#80002004
  .word 0x584944fc			#80002008
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x28cb8c74
 
RVTEST_DATA_END				#end of data section