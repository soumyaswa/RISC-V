
# See LICENSE.vyoma for more details
 
#include "test_macros.h"
#include "riscv_test.h"
//****************************************************
/*
virtual to physical address translating (instruction)
	VA = 0x80000000  
	satp = 0x80000000000080010
	L2 pte_addr=0x80010010, pte_val=0x20004401
	L1 pte_addr=0x80011000, pte_val=0x20004801
	L0 pte_addr=0x80012000, pte_val=0x200000cf
	PA = 0x80000000
virtual to physical address translating (data)
	VA = 0x401bddc
	satp = 0x8000000000080010
	L2 pte_addr=0x80010000, pte_val=0x20004401
	L1 pte_addr=0x80011100, pte_val=0x20004801
	L0 pte_addr=0x800120d8, pte_val=0x20004ccb
	PA = 0x80013dda
*/
//**************************************************
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

li gp,3
 
j start

trap:
	csrr x23,mcause
	csrr x23,mepc
 
	li x25,0x20004ccf
	li x26,0x800120d8
	sw x25,(x26)

	li x27,0x800120d8
	li x28,0x4000
 
	.rept 5
	add x27 ,x27,x28
	lw x29,(x27)
	.endr
 
	addi x23,x23,4
	csrw mepc,x23
	mret
 
start:

#define va 0x401bddc
 
	li x20,0xf
	csrw pmpcfg0,x20
	li x21,0xffffffff
	csrw pmpaddr0,x21
 
	la x22,trap
	csrw mtvec,x22
 
	li x19,0x800
	csrw mstatus,x19
	la x18,s_mode
	csrw mepc,x18
	mret
 
s_mode:
	li x6,0x80010
	li x7,0x8000000000000000
	or x6,x6,x7
	csrw satp,x6
	nop
	nop
	nop
	nop
 
	li x8,0x1234
	li x9,va
	lw x8,(x9)
	li x27,0x0
	sfence.vma x9,x27
  sw x10,(x9)
  addi x25,x8,1
 
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
.dword 0x0000000020004c8f
 
/*
  .skip (0x80010010 - 0x80010000)
.dword (0x0000000020004401)
.skip (0x80011000 - 0x80010010 - 8)
.dword (0x0000000020004801)
.skip (0x80012000 - 0x80011000 - 8)
.dword (0x00000000200000cf)
*/
/*
  .skip (0x80010010 - 80010000 )
.dword 0x0000000020004401
.skip (0x80011000 - 80010010 - 8)
.dword 0x0000000020004801
.skip (0x80012000 - 80011000 - 8)
.dword 0x00000000200000cf
*/
RVTEST_DATA_END