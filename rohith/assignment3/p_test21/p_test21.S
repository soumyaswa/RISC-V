# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

mainblock:
li x5, 10
csrrw x6, mscratch, x5
csrr  x9, mscratch
csrrs x7, mscratch, x6
csrr  x9, mscratch
csrrc x8, mscratch, x7
csrr  x9, mscratch
csrrw x6, mscratch, x5
j loop

loop:
csrr x10, mscratch 
csrw mscratch, x10
csrs mscratch, x10
csrc mscratch, x5
j loop1

loop1:
csrrwi x7, mscratch, 10
csrrsi x7, mscratch, 1
csrrci x7, mscratch, 10
j loop2

loop2:
csrwi mscratch, 11
csrsi mscratch, 12
csrci mscratch, 10 // not clearing teh bits


//if x0 used in these csr instrcution or ZICSR extension, then the intsruction is ignored and replaced by nop
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

















