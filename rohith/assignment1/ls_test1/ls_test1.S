# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test:
la x3, inp_data //loading the addr
lw x5,  0(x3);
lw x5,  8(x3); 
lw x5, 16(x3); 
lw x5, 24(x3); 
lw x5, 32(x3); 
lw x5, 40(x3); 
lw x5, 48(x3); 
lw x5, 56(x3); 
lw x5, 64(x3); 
lw x5, 72(x3);     
lw x5, 80(x3);// no mem init 
lw x5, 88(x3);//     "
lw x5, 96(x3);//     "

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .dword 0x0000000000000001
  .dword 0x0000000000000002
  .dword 0x0000000000000003
  .dword 0x0000000000000004
  .dword 0x0000000000000005
  .dword 0x0000000000000006
  .dword 0x0000000000000007
  .dword 0x0000000000000008
  .dword 0x0000000000000009
  .dword 0x0000000000000010

RVTEST_DATA_END

