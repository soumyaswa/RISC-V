# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


loop1:
bne x5, x0,loop2

loop2:
bne x5, x0,loop3

loop3:
bne x5, x0,loop4

loop4:
bne x5, x0,loop5

loop5:
bne x5, x0,loop6

loop6:
bne x5, x0,loop7

loop7:
bne x5, x0,loop8

loop8:
li x6, 16
bne x5, x0, loop9

loop9:
bge x5, x8, exit
.rept 64
add x8, x8, 1      //counter for instructions number
.endr
j loop9

exit:
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















