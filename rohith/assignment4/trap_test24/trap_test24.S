# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


// funct1 and funct 2 need two inputs 
test9:
csrr x15, mtvec
la x9, trap_handler
csrw mtvec, x9
la x13, inp_data // for mcause=6 store address misaligned
sh x4, 1(x13)
j exit

loop:
addi x1, x1, 1
nop
nop
addi x1, x1,-1 //if nop here, it is jumping to above line before going into trap handler

trap_handler:
nop
csrr x12, mcause
nop
csrr x11, mepc
addi x11, x11, 4
csrw mepc, x11
csrw mtvec, x15
mret

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



















