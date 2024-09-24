# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

mainblock:
//if x5 is 2, then it is going to user automatically, and accessing csrs is possible in all extensions, because not working RV64U 
li x5, 0x0800
la x6, label1
csrw mepc, x6 
csrw mstatus, x5
csrr x8, mstatus
mret

label1:  // test for M->S->U
nop
nop
nop
li x5, 0x0
csrw sstatus, x5
la x9, loop2
csrr x8, sstatus
csrw sepc, x9
sret

loop2:
nop
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















