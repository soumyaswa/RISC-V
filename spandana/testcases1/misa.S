# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN

START:
 li gp,3
 li x6,0x12D  
 csrw misa,x6
 li x17, 0x6000
 csrs 0x300, x17
 
test1:
  li x8, 10
  li x9, 20
  add x10,x8,x9
  addi x10,x4,20 
  andi x10,x8,35     
  ori x10,x9,25 
  

test2:
  la x13,inp_data
  la x16,amo_data
min:
  amomin.w x15,x14,(x13)
max:
  amomax.w x17,x14,(x13)
add:
  amoadd.w x10,x14,(x13)
binary_op:
  amoand.w x12,x14,(x13)
  amoor.w x13,x14,(x13)
 add x15,x13,x14
  amoxor.w x15,x14,(x16) 

  
test3:
 c.li x12,10
 c.li x14,20
 c.add x14,x12
 c.or x14,x12

 la x8, inp_data
 c.lw x9, 0(x8)
 c.li x12, 20
 c.sw x12,0(x8)
 

 
test4:
 la x6,float_inp
 lw x7,4(x6)
 fmv.s.x f1, x6
 fmv.s.x f2, x7
 fadd.s f4,f1,f2
 fsub.s f5,f2,f1
 fmin.s f9, f1, f2
 fmax.s f10, f1, f2 
 
  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
amo_data:
 .word 0x123456
inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  
float_inp:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5
RVTEST_DATA_END
