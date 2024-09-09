# See LICENSE.vyoma for more details
 
#include "test_macros.h"	#includes "test_macros.h" header file 
#include "riscv_test.h"		#includes "riscv_test.h" header file
 
RVTEST_RV32U		#sets up a 64bit user mode 
RVTEST_CODE_BEGIN	#beginning of the test code

#RAW, WAW, WAR HAZARDS
 
  li gp, 1      #load immediate value 1 into gp(x3)
  li x1, 10     #load immediate value 10 into x1
  li x2, 20     #load immediate value 20 into x2

  #li x14, 0x80002000	  #to check whether the inp_data is present in the expected add or not
  #lw x13,0(x14)
RAW_hazard:
  add x3,x1,x2		#values of x1 and x2 are added and result is stored in x3
  sub x4,x3,x1		#value of x3 is substracted from x2 and result is stored in x3

WAR_hazard:
  add x1,x5,x2		#values of x5 and x2 are added and result is stored in x1
  sub x5,x1,x2		#value of x1 is substracted from x2 and result is stored in x5

WAW_hazard:
  add x6,x1,x2		#values of x1 and x2 are added and result is stored in x6
  sub x6,x2,x1		#value of x2 is substracted from x1 and result is stored in x6
 
 
  TEST_PASSFAIL		#checks for pass or fail		
 
RVTEST_CODE_END         #end of test code
 
  .data			#defines the data used for loads in testcase
 
RVTEST_DATA_BEGIN	#beginning of data section
  TEST_DATA
 
 
inp_data:
  .word 0x06627912       #80002000
  .word 0x06627912	 #80002004
  .word 0x584944fc	 #80002008
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
 
RVTEST_DATA_END		#end of data section