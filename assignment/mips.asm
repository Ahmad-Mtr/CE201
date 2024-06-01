.data
prompt1: .asciiz "\nPlease enter first number: "
prompt2: .asciiz "\nPlease enter second number: "
prompt3: .asciiz "\nPlease enter the operation: "
error: .asciiz "\nError: Please enter another value of Y."
mod_result: .asciiz "%d mod %d = %d\n"
pow_result: .asciiz "\n%d to the power %d = %d\n"

.text
.globl main

# Function: modulus
modulus:
    # Arguments: $a0 = x, $a1 = y
    # Return: $v0 = mod
    li $v0, 0           # mod = 0
    beq $a1, $zero, error_modulus
    div $a0, $a1        # x / y
    mfhi $v0            # mod = remainder (hi)
    jr $ra

error_modulus:
    # Commented out since syscall is not used
    # la $a0, error
    # li $v0, 4
    # syscall
    jr $ra

# Function: power
power:
    # Arguments: $a0 = x, $a1 = y
    # Return: $v0 = p
    li $v0, 1           # p = 1
    move $t0, $a1       # t0 = y
power_loop:
    beq $t0, $zero, end_power_loop
    mul $v0, $v0, $a0   # p *= x
    subu $t0, $t0, 1    # y--
    j power_loop
end_power_loop:
    jr $ra

# Main Program
main:
    # Commented out since syscall is not used
    # la $a0, prompt1
    # li $v0, 4
    # syscall
    # li $v0, 5
    # syscall
    # move $s0, $v0       # X = v0

    # Commented out since syscall is not used
    # la $a0, prompt2
    # li $v0, 4
    # syscall
    # li $v0, 5
    # syscall
    # move $s1, $v0       # Y = v0

    # Initialize X and Y manually
    li $s0, 10           # X = 10 (example value)
    li $s1, 3            # Y = 3 (example value)

loop:
    # Commented out since syscall is not used
    # la $a0, prompt3
    # li $v0, 4
    # syscall
    # li $v0, 12
    # syscall
    # move $t2, $v0       # operation = v0

    # Initialize operation manually
    li $t2, '%'          # operation = '%' (example operation)

    # Switch case for operation
    li $t0, '%'
    beq $t2, $t0, mod_case
    li $t0, '^'
    beq $t2, $t0, pow_case
    li $t0, 'q'
    beq $t2, $t0, quit
    j loop

mod_case:
    move $a0, $s0       # x
    move $a1, $s1       # y
    jal modulus
    move $s2, $v0       # Results = mod(x, y)
    # Commented out since syscall is not used
    # la $a0, mod_result
    # move $a1, $s0
    # move $a2, $s1
    # move $a3, $s2
    # li $v0, 4
    # syscall
    j loop

pow_case:
    move $a0, $s0       # x
    move $a1, $s1       # y
    jal power
    move $s2, $v0       # Results = pow(x, y)
    # Commented out since syscall is not used
    # la $a0, pow_result
    # move $a1, $s0
    # move $a2, $s1
    # move $a3, $s2
    # li $v0, 4
    # syscall
    j loop

quit:
    # Commented out since syscall is not used
    # li $v0, 10
    # syscall
    j quit  # Infinite loop to simulate program end
