# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test:

la x3, inp_data  // loading the addr
li x5, 0x1234567812345678
sd x5, 0(x3) 

sw x5, 0(x3)
sw x5, 4(x3)

sh x5, 0(x3) 
sh x5, 2(x3) 
sh x5, 4(x3)
sh x5, 6(x3) 

sb x5, 0(x3)
sb x5, 1(x3)
sb x5, 2(x3)
sb x5, 3(x3)
sb x5, 4(x3)
sb x5, 5(x3)
sb x5, 6(x3)
sb x5, 7(x3)

ld x5, 0(x3)

li x5, -1
sd  x5, 8(x3)
li x5, 1
sd  x5, 8(x3)


  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .dword 0x1234567812345678 //8000_2000
  .dword -1
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






