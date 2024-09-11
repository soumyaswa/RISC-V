# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
 
begin:
li gp,3

#li x6,0x112c
li x6,0x112d  
csrw misa,x6

li x7, 0x6000
csrs mstatus, x7

arith_test:
  li x4, 15
  li x5, 20
  add x8,x4,x5
  addi x9,x4,20 
  andi x8,x8,35     
  ori x9,x9,25 
  xor x8,x8,x9

 
amo_test:
  la x11,inp_data
  la x12,data1

  amomin.w x13,x9,(x11)
  amomax.w x14,x9,(x11)
  amoadd.w x15,x9,(x12)
  amoand.w x16,x9,(x12)
  amoor.w x17,x9,(x11)
  amoxor.w x18,x9,(x12)
 
  
comp_test:
  c.li x14,10
  c.li x15,20
  c.add x14,x12
  c.or x14,x12
 
  la x8, inp_data
  c.lw x9, 0(x12)
  c.li x8, 20
  c.sw x14,0(x12)

 

float_test:
  la x6,float_inp
  flw f7,0(x6)
  fmv.s.x f1, x7
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
data1:
  .word 0x12
  .word 0x4567
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
