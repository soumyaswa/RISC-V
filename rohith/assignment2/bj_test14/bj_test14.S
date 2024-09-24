# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

// unconditional jumps with nested depth of 9 and in loop 9 itis runnign 16 times
loop1:
auipc x8, 0
jalr x0, 8(x8)

loop2:
jalr x0, 20(x8)
nop
nop
nop
j exit

loop3:
j loop4

loop4:
j loop5

loop5:
jal x0, loop6

loop6:
jal x0, loop7

loop7:
jal x0, loop8

loop8:
li x6, 16
jal x0, loop9

loop9:
blt x6, x7, exit
add x6, x6, -1
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














