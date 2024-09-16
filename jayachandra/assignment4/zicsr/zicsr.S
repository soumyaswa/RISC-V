# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test:

la x8, inp_data
lw x9, 0(x8)
li x4,2          	        # x9=0x06627912  
csrw mscratch, x9
csrrw x2, mscratch, x4

test1:

la x8, inp_data            //584944fc
lw x9, 8(x8)
li x4,3
csrw mscratch, x9     	      
csrrs x5, mscratch, x4

test2:

la x8, inp_data
lw x9, 16(x8)       
li x4,3
csrw mscratch, x9      //558f5366  	      
csrrc x7, mscratch, x4

test3: 

la x8, inp_data
lw x9, 24(x8)       // 29df2fb1 
csrrwi x8, mscratch, 12
csrrsi x10, mscratch, 3
csrrci x12, mscratch, 4

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












