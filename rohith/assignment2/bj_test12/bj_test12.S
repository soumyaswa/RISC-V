# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20


test9: 
auipc x7, 0      //loading the current pc into x7
jalr x1, 12(x7)   //Jump to (x7+12) --- 1st jump
addi x2, x2, 1   //incr x2 by 1
j exit           //exit

label1:          
nop              //incr the pc
addi x2, x2, 1    //incr x2 by 1 --- random instruction
auipc x8, 0      //loading the current pc into x8
jalr x1, 16(x8)  //Jump to x8+16 --- 2nd jump
nop              //incr the pc
nop              //incr the pc
ret              //ret --- for 1st jump      

label2:
nop              //incr the pc
auipc x9, 0      //loading the current pc into x9
//jalr x1, 16(x9)  //Jump to (x9+16) --- 3rd jump
addi x2, x2, 1   //incr x2 by 1
nop              //incr the pc
ret              //ret --- for 2nd jump

label3:
nop              //incr the pc
nop              //incr the pc
//ret 3            //ret --- for 3rd jump

exit:            //exit code
nop              //incr the pc

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












