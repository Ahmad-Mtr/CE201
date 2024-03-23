[BEST YOUTUBE VIDEO TO WATCH RIGHT NOW](https://youtu.be/-uleG_Vecis?feature=shared)


> Note: Each Memory Adress is 1 Byte (8-bits)
>    AND Each Register is 4 Bytes (32-bit), which means u need 4 Memory addresses.
 
## MIPS Registers

| Register       | Name          | Usage                                                           |
| -------------- | ------------- | --------------------------------------------------------------- |
| `$zero`, `$0`  | Zero          | Hardwired zero, always reads as zero, cannot be written         |
| `$at`          | `$1`          | Reserved for assembler use                                      |
| `$v0`, `$v1`   | `$2` - `$3`   | Return values from functions, function results                  |
| `$a0` to `$a3` | `$4` -`$7`    | Function arguments                                              |
| `$t0` to `$t7` | `$8`- `$15`   | Temporary registers, not preserved across function calls        |
| `$s0` to `$s7` | `$16` - `$23` | Saved registers, preserved across function calls                |
| `$t8` to `$t9` | `$24` - `$25` | More temps                                                      |
| `$k0` - `$k1`  | `$26` - `$27` | Reserved for OS Kernel                                          |
| `$gp`          | `$28$`        | Global pointer, used for accessing global data                  |
| `$sp`          | `$29$`        | Stack pointer, points to the top of the stack                   |
| `$fp`          | `$30$`        | Frame pointer, used for accessing function arguments and locals |
| `$ra`          | `$31$`        | Return address for function calls, saved during function calls  |

## Endianess
**Little Endian**: Most Significant Byte --> Least address 
**Big Endian:** Little Endian Opposite ofc :)

> MIPS is Big Endian
## Some Instructions

```mips
# Most used MIPS Instructions Summary:

# Load and Store Instructions:
# lw - Load Word: Loads a word from memory into a register.
# sw - Store Word: Stores a word from a register into memory.

# Arithmetic Instructions:
# add - Add: Adds two registers and stores the result in a register.
# addi - Add Immediate: Adds a constant to a register and stores the result in a register.
# sub - Subtract: Subtracts one register from another and stores the result in a register.
# addu, subu - Unsigned Add/Subtract: Similar to add and sub but treat operands as unsigned.

# Data Transfer Instructions:
# lb - Load Byte: Loads a byte from memory into a register.
# lh - Load Halfword: Loads a halfword from memory into a register.

# Branch Instructions:
# beq - Branch if Equal: Branches to a target address if two registers are equal.
# bne - Branch if Not Equal: Branches to a target address if two registers are not equal.

# Logical Instructions:
# and - Bitwise AND: Performs a bitwise AND operation between two registers.
# or - Bitwise OR: Performs a bitwise OR operation between two registers.
# xor - Bitwise XOR: Performs a bitwise XOR operation between two registers.
# nor - Bitwise NOR: Performs a bitwise NOR operation between two registers.

# Shift Instructions:
# sll - Shift Left Logical: Shifts the bits in a register to the left by a specified number of positions.
# srl - Shift Right Logical: Shifts the bits in a register to the right by a specified number of positions.

# Conditional and Loop Instructions:
# slt - Set Less Than: Sets a register to 1 if one register is less than another, else sets it to 0.
# sltu - Set Less Than Unsigned: Sets a register to 1 if one register is less than another (unsigned), else sets it to 0.
# beq, bne - Branch if Equal/Not Equal: Branches to a target address based on a condition.
# j - Jump: Unconditionally jumps to a target address.

# Comparison Instructions:
# slt, sltu - Signed/Unsigned Less Than: Compare two registers and set a target register based on the result.


```