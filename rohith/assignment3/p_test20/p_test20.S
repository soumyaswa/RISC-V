# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

mainblock:
li x5, 0x000 //x11 and x12 in mstatus and 8 in sstatus
la x6, loop1
csrr x7, mstatus
csrs mstatus, x5
csrr x7, mstatus
csrw mepc, x6
mret

#li x5, 0x000 //x11 and x12 in mstatus and 8 in sstatus
#la x6, loop1
#csrr x7, sstatus
#csrs sstatus, x5
#csrr x7, sstatus
#csrw sepc, x6

loop1:
nop
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

















