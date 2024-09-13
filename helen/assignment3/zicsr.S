# See LICENSE.vyoma for more details 
#include "test_macros.h"		
#include "riscv_test.h"			
RVTEST_RV64M				
RVTEST_CODE_BEGIN			
 
START:
  li gp, 3
  
  csrr x15,mscratch
  
  la x8, 0x12345678
   	         
  csrw mscratch, x8
 
csrrw_test:
   addi x16,x16,1
   csrrw x2, mscratch, x16    #reads csr, writes value in x16 to csr, stores old value in csr to rd
   
   
csrrs_test:
   sub x16,x16,x16
   csrrs x2, mscratch, x16    #reads csr, sets the bits in x16 to csr, stores old value in csr to rd
   
   
csrrc_test:
   ori x16,x16,3
   csrrc x2, mscratch, x16    #reads csr, clears the bits of x16 in csr, stores old value in csr to rd
   
   
csrrwi_test:
   la x5,inp_data
   lw x10,0(x5)
   csrrwi x2, mscratch, 1      #reads csr, writes the immediate to csr, stores old value in csr to rd
   
   
csrrsi_test:
   andi x10,x10,0
   csrrsi x2, mscratch, 20    #reads csr, sets the bits of immediate in csr, stores old value in csr to rd
   
   
csrrci_test:
   addi x16,x16,1
   csrrci x2, mscratch, 7     #reads csr, clears the bits of immediate in csr, stores old value in csr to rd
   

#j exit
 
exit:
    nop
 
 
TEST_PASSFAIL				
RVTEST_CODE_END         	
  .data					
RVTEST_DATA_BEGIN		
  TEST_DATA

inp_data:
  .word 0x06627912       	
  .word 0x06627912	 		
  .word 0x584944fc			
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x28cb8c74
RVTEST_DATA_END				