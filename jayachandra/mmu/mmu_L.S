# See LICENSE.vyoma for more details
#include "test_macros.h"
#include "riscv_test.h"
 
 
/*
sv39
Instruction:va=0x80000000
satp=0x8000000000080010
L2 pte_addr=0x80010010, pte_val=0x20004401
L1 pte_addr=0x80011000, pte_val=0x20004801
L0 pte_addr=0x80012000, pte_val=0x200000cf
pa=0x80000000
 
Data:va=ox401bdda
satp=0x8000000000080010
L2 pte_addr=0x80010000, pte_val=0x20004401
L1 pte_addr=0x80011100, pte_val=0x20004801
L0 pte_addr=0x800120d8, pte_val=0x20004ccf
pa=80013dda
*/
 
RVTEST_RV64M
RVTEST_CODE_BEGIN
  j start
trap_handler: 
  csrr x9,mtval
  csrr x10,mcause
  csrr x6,mepc
  addi x6,x6,4
  csrw mepc,x6
  mret
start:
  li gp, 3
  la x6, trap_handler
  csrw mtvec, x6
 
#define virtual_address 0x401bdda
 
test:
  li x18,0xf
  csrw pmpcfg0,x18
  li x6,0xffffffff
  csrw pmpaddr0,x6
  li x4, 0x800
  csrs mstatus, x4
  la x6, s_mode
  csrw mepc, x6
  mret
 
s_mode:
  li x7, 0x8000000000080010
  csrw satp, x7
  nop
  nop
  nop
  li x10, virtual_address
  li x7, 0xffffffff
  lw x6, 2(x10)
 

exit:
  nop
  TEST_PASSFAIL
RVTEST_CODE_END

  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
.dword 0x0000000020004401
 
.skip (0x80010010 - 0x80010000 - 8)
.dword 0x0000000020004401
 
.skip (0x80011000 - 0x80010010 - 8)
.dword 0x0000000020004801
 
.skip (0x80011100 - 0x80011000 - 8)
.dword 0x0000000020004801
 
.skip (0x80012000 - 0x80011100 - 8)
.dword 0x00000000200000cf
 
.skip (0x800120d8 - 0x80012000 - 8)
.dword 0x0000000020004ccd
 
/*
inp_data:
.skip (0x80010010 - 0x80010000 )
.dword 0x0000000020004401
 
.skip (0x80011000 - 0x80010010 - 8)
.dword 0x0000000020004801
 
.skip (0x80012000 - 80011000 - 8)
.dword 0x00000000200000cf
*/
/*
.skip (0x80010010 - 0x80010000)
.dword (0x0000000020004401)
.skip (0x80011000 - 0x80010010 - 8)
.dword (0x0000000020004801)
.skip (0x80012000 - 0x80011000 - 8)
.dword (0x00000000200000cf)
*/
RVTEST_DATA_END