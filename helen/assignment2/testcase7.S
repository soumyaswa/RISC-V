  # See LICENSE.vyoma for more dexails 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

#Conditional Branches in loops . nested for loops with varying nesting depth (1 to 8) 
  
    li x1, 0       # Outer Loop counter
    li x2, 0       # Loop1 counter
    li x3, 0       # Loop2 counter
    li x4, 0       # Loop3 counter
    li x5, 0       # Loop4 counter
    li x6, 0       # Loop5 counter
    li x7, 0       # Loop6 counter
    li x8, 0       # Loop7 counter
    li x9, 2       # No. of iterations 

    li x10, 5      # immediate value 

outer_loop:
    bge x1, x9, end  # if Outer Loop counter >= 2, exit
    li x2, 0         # Reset Loop1 counter

loop1:
    bge x2, x9, outer_loop_end  # if Loop1 counter >= 2, go to outer_loop_end
    li x3, 0         # Reset Loop2 counter

loop2:
    bge x3, x9, end2  # if Loop2 counter >= 2, go to end2
    li x4, 0         # Reset Loop3 counter

loop3:
    bge x4, x9, end3  # if Loop3 counter >= 2, go to end3
    li x5, 0         # Reset Loop4 counter

loop4:
    bge x5, x9, end4  # if Loop4 counter >= 2, go to end4
    li x6, 0         # Reset Loop5 counter

loop5:
    bge x6, x9, end5  # if Loop5 counter >= 2, go to end5
    li x7, 0         # Reset Loop6 counter

loop6:
    bge x7, x9, end6  # if Loop6 counter >= 2, go to end6
    li x8, 0         # Reset Loop7 counter

loop7:
    bge x8, x9, end7  # if Loop7 counter >= 2, go to end7
    andi x11, x8, 3  # Bitwise AND immediate: x8 & 3, result in x11
    sll x12, x11, 2  # Shift left logical: x11 << 2, result in x12
    srl x13, x12, 1  # Shift right logical: x12 >> 1, result in x13
    slti x14, x13, 10 # Set less than immediate: if x13 < 10, x14 = 1, else x14 = 0
    mv x15, x14      # Move the value of x14 to x15
    addi x8, x8, 1   # Increment Loop7 counter
    bne x8, x9, loop7  # branches to the start of Loop7 if loop count != 2

# End of Loop7
end7:
    addi x7, x7, 1       # Increment Loop6 counter
    jal x0, loop6        # jump to the start of loop6 
# End of Loop6
end6:
    addi x6, x6, 1       # Increment Loop5 counter
    jal x0, loop5   # jump to the start of Loop5
# End of Loop5
end5:
    addi x5, x5, 1       # Increment Loop4 counter
    jal x0, loop4   # jump to the start of Loop4

# End of Loop4
end4:
    addi x4, x4, 1       # Increment Loop3 counter
    jal x0, loop3   # jump to the start of loop3 

# End of Loop3
end3:
    addi x3, x3, 1       # Increment Loop2 counter
    jal x0, loop2   # jump to the start of Loop2

# End of Loop2
end2:
    addi x2, x2, 1       # Increment Loop1 counter
    jal x0, loop1   # jump to the start of Loop1

# End of Outer Loop
outer_loop_end:
    addi x1, x1, 1       # Increment Outer Loop counter
    jal x0, outer_loop  # jump to the start of outer loop

end:
    nop                   # End of the test
              



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








