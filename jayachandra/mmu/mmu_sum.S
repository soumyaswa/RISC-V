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
Data:va=ox401bddc
satp=0x8000000000080010
L2 pte_addr=0x80010000, pte_val=0x20004401
L1 pte_addr=0x80011100, pte_val=0x20004801
L0 pte_addr=0x800120d8, pte_val=0x20004ccd   d=1101,f=1111,7=0111,b=1011
pa=80013ddc
*/
RVTEST_RV64M
RVTEST_CODE_BEGIN
 
#define virtual_address 0x401bddc
  j start
 
trap_handler: 

  csrr x9,mtval
  csrr x10,mcause
  csrr x6,mepc
  
  li x21,0x200000df
  li x22,0x80012000
  sw x21,(x22)
  
  li x8,0x20004cdf
  li x9,0x800120d8
  sw x8,(x9)
  
  li x27,0x800120d8
  li x28,0x4000
  .rept 5
  add x27 ,x27,x28
  lw x29,(x27)
  .endr
  
  li x9, virtual_address
  li x27,0
  sfence.vma
  csrw mepc,x6
  mret
 
start:
  li gp, 3
  la x6, trap_handler
  csrw mtvec, x6
  
test:

  li x18,0xf
  csrw pmpcfg0,x18
  li x6,0xffffffff
  csrw pmpaddr0,x6
  
  li x7, 0x8000000000080010
  csrw satp, x7
  
  li x9,0x40800
  csrw mstatus,x9
  la x6, s_mode
  csrw mepc, x6
  mret
 
s_mode:

  li x6,0x40000
  csrw sstatus,x6
  la x7,u_mode
  csrw sepc,x7
  sret
 
u_mode:

  nop
  nop
  nop
  li x20, virtual_address
  li x7, 0xffffffff
  lw x29,(x20)
  sw x7,(x20)
  nop
  nop
 
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
.dword 0x0000000020004cdf
RVTEST_DATA_END