  # See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN


  li gp, 3
    
#nested Loop (varying depth 1 to 8) with varying number of instructions inside the loop. number of instructions varying from 1 to 64   

            
            
    li x1, 0          # outer Loop counter
    li x2, 0       # Loop1 counter
    li x3, 0       # Loop2 counter
    li x4, 0       # Loop3 counter
    li x5, 0       # Loop4 counter
    li x6, 0       # Loop5 counter
    li x7, 0       # Loop6 counter
    li x8, 0       # Loop7 counter
    li x9, 1       # No. of iterations 
  
    li x15,1
    li x16,2
    li x17,0
    la x22,inp_data
     la x24,data1

     li x11,3
     addi x12,x11,5

     slli x25, x25, 16
      slli x25, x25, 16
      li x21, 0
      or x21, x21, x25
	
      la x19,data2


outer_loop:
    bge x1, x9, end  # if Loop0 counter >= 2, exit
    li x2, 0                  # Reset Loop1 counter

loop1:
    bge x2,x9,outer_loop_end   # if Loop1 counter >= 2, go to outer_loop_end
    .rept 4
        mul x10, x11, x12   #multiplication
        div x13, x14, x10   #  division 
        andi x16, x12, 7  # Bitwise AND immediate 
        ori x18, x11, 1   # Bitwise OR immediate 
    .endr

    li x3, 0                   # Reset Loop2 counter

loop2:
    bge x3, x9, end2     # if Loop2 counter >= 2, go to end2
    li x4, 0                   # Reset Loop3 counter

loop3:
    bge x4, x9, end3     # if Loop3 counter >= 2, go to end3
    .rept 8
        amoadd.w x20, x16, 0(x22)  # Atomic addition (address in x22, value in x21)
        amoxor.w x23, x18, 0(x24)  # Atomic XOR (address in x25, value in x24)
    .endr

    li x5, 0                   # Reset Loop4 counter

loop4:
    bge x5, x9, end4     # if Loop4 counter >= 2, go to end4
    li x6, 0                   # Reset Loop5 counter

loop5:
    bge x6, x9, end5     # if Loop5 counter >= 2, go to end5
    .rept 4
        fmv.s.x f0, x21
        flw f5, 0(x19)
        fadd.s f7, f5,f0
        fmadd.s f7,f7,f7,f5
    .endr
    li x7, 0                   # Reset Loop6 counter

loop6:
    bge x7, x9, end6     # if Loop6 counter >= 2, go to end6
    .rept 4
      andi x30,x15,2
      ori x31,x30,5
    .endr
    li x8, 0                   # Reset Loop7 counter


loop7:
    bge x8, x9, end7     # if Loop7 counter >= 2, go to end7

    .rept 8
       mul x17,x15,x16
    .endr

    addi x8, x8, 1
    j loop7                   # Jump to the start of Loop7
    

# End of Loop7
end7:
    addi x7, x7, 1            # Increment Loop6 counter
    j loop6                   # Jump to the start of Loop6
    

# End of Loop6
end6:
    addi x6, x6, 1            # Increment Loop5 counter
    j loop5                   # Jump to the start of Loop5
    

# End of Loop5
end5:
    addi x5, x5, 1            # Increment Loop4 counter
    j loop4                   # Jump to the start of Loop4
    

# End of Loop4
end4:
    addi x4, x4, 1            # Increment Loop3 counter
    j loop3                   # Jump to the start of Loop3
     

# End of Loop3
end3:
    addi x3, x3, 1            # Increment Loop2 counter
    j loop2                   # Jump to the start of Loop2
    

# End of Loop2
end2:
    addi x2, x2, 1            # Increment Loop1 counter
    j loop1                   # Jump to the start of Loop1

# End of Outer Loop
outer_loop_end:
    addi x1, x1, 1            # Increment Outer Loop counter
    j outer_loop              # Jump to the start of Outer Loop

end:
    nop               



  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

data1:
  .dword 0x20030110

data2:
  .float 1.5

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
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74

RVTEST_DATA_END









