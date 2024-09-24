# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

test:

la x3, inp_data  // loading the addr
li x5, 10       // load imm 100 to x5

lw x5, 0(x3)     // loading value at addr in x3 to x5 & Storing x5 to addr in x3 and similarly all furthur address also.
sw x5, 0(x3)   
lw x5, 8(x3)
sw x5, 8(x3) 
lw x5, 16(x3)
sw x5, 16(x3) 
lw x5, 24(x3)
sw x5, 24(x3) 
lw x5, 32(x3)
sw x5, 32(x3) 
lw x5, 40(x3)
sw x5, 40(x3) 
lw x5, 48(x3)
sw x5, 48(x3) 
lw x5, 56(x3)
sw x5, 56(x3) 
lw x5, 64(x3)
sw x5, 64(x3) 
lw x5, 72(x3)
sw x5, 72(x3)     

sw x5, 80(x3)    // no mem init in .data section for this addr 
sw x5, 88(x3)    //     "
sw x5, 96(x3)    //     "

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .dword 0x0000000000000001 //8000_2000
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



