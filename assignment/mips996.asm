.data
msg1: .asciiz "\nPlease enter first number : "
msg2: .asciiz "\nPlease enter second number : "
msg3: .asciiz "\nPlease enter the operation : "
modulus_result: .asciiz "%d mod %d = %d\n"
power_result: .asciiz "\n%d to the power %d = %d\n"
error_message: .asciiz "\nError: Please enter another value of Y."
newline: .asciiz "\n"
operation: .space 4  # for storing the operation character
X: .word 0
Y: .word 0
Loop: .word 1

.text
.globl main

main:
    # Print msg for first number
    li $v0, 4
    la $a0, msg1
    syscall

    # Read first number
    li $v0, 5
    syscall
    sw $v0, X

    # Print msg for second number
    li $v0, 4
    la $a0, msg2
    syscall

    # Read second number
    li $v0, 5
    syscall
    sw $v0, Y

main_loop:
    # Check loop condition
    lw $t0, Loop
    beq $t0, $zero, end_program

    # Print msg for operation
    li $v0, 4
    la $a0, msg3
    syscall

    # Read operation character
    li $v0, 12
    syscall
    sb $v0, operation

    # Load X and Y
    lw $t1, X
    lw $t2, Y

    # Determine the operation
    lb $t3, operation
    li $t4, 37   # ASCII for '%'
    li $t5, 94   # ASCII for '^'
    li $t6, 113  # ASCII for 'q'

    beq $t3, $t4, perform_modulus
    beq $t3, $t5, perform_power
    beq $t3, $t6, end_program

    # Clear screen, system("cls"). didn't find the one for it so I used a newline.
    li $v0, 4
    la $a0, newline
    syscall

    j main_loop

perform_modulus:
    lw $t1, X
    lw $t2, Y

    beq $t2, $zero, modulus_error

    # Perform modulus
    div $t1, $t2
    mfhi $t7

    ###
    #li $v0, 1
    #move $a0, $t7
    #syscall


    # Print result
    li $v0, 4
    la $a0, modulus_result
    syscall

    move $a0, $t1
    move $a1, $t2
    move $a2, $t7
    li $v0, 1
    syscall

    j main_loop

modulus_error:
    li $v0, 4
    la $a0, error_message
    syscall
    j main_loop

perform_power:
    # Initialize result to 1
    li $t7, 1

    # Loop for power calculation
    move $t8, $t2  # Counter

power_loop:
    beq $t8, $zero, power_done
    mul $t7, $t7, $t1
    subi $t8, $t8, 1   # Not in the Manual, but we took it in course.
    j power_loop

power_done:
    # Print result
    li $v0, 4
    la $a0, power_result
    syscall

    move $a0, $t1
    move $a1, $t2
    move $a2, $t7
    li $v0, 1
    syscall

    j main_loop


end_program:
    # Exit
    li $v0, 10
    syscall
