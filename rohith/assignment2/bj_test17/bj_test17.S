# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

// funct1 and funct 2 need two inputs 
test9:
li x5, 10 //load the 1st input
li x6, 20 //load the 2nd input
la x7, funct1 //loading the funct1 and funct 2 addrs into x7, and x8.
la x8, funct2
jalr x1, 0(x7) //funct1 calling using jalr
jalr x1, 0(x8) //funct2 calling using jalr

j exit //exiting 

funct1: //add of x5 and x6
add x9, x5, x6
ret // calling return

funct2: //xor of x5 and x6
xor x9, x5, x6
ret // calling return

exit: // exit code
nop

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .dword 0x1234567812345678 //8000_2000
  .dword 0x0000000000000002 //8000_2008
  .dword 0x0000000000000003 //8000_2010
  .dword 0x0000000000000004 //8000_2018
  .dword 0x0000000000000005 //8000_2020
  .dword 0x0000000000000006 //8000_2028
  .dword 0x0000000000000007 //8000_2030
  .dword 0x0000000000000008 //8000_2038
  .dword 0x0000000000000009 //8000_2040
  .dword 0x0000000000000010 //8000_2048


RVTEST_DATA_END
















