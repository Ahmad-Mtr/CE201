| Category           | Instruction                | Example               | Meaning                                  | Comments                          |
| ------------------ | -------------------------- | --------------------- | ---------------------------------------- | --------------------------------- |
| Arithmetic         | add                        | `add $s1,$s2,$3`      | `$s1 = $s2 + $s3`                        | Three operands; data in registers |
|                    | subtract                   | `sub $s1,$s2,$3`      | `$s1 = $s2 - $s3`                        | Three operands; data in registers |
| Data transfer      | load word                  | `lw $s1,100($s2)`     | `$s1 = Memory[$s2 + 100]`                | Data from memory to register      |
|                    | store word                 | `sw $s1,100($S2)`     | `Memory[$S2 + 100] = $S1`                | Data from register to memory      |
| Logical            | AND                        | `and $s1, $s2, $s3`   | `s1  = s2 && s3`                         |                                   |
|                    | OR                         | `or $s1, $s2, $s3`    |                                          |                                   |
|                    | NO                         | `nor $s1, $s2, $s3`   |                                          |                                   |
|                    | AND immediate              | `andi $s1, $s2, 99`   |                                          |                                   |
|                    | OR immdiate                | `ori ...`             |                                          |                                   |
|                    | shift left logical         | `sll $s1, $s2, 2`     | other way of Multiply<br>`s1 = s2 * 2^2` |                                   |
|                    | shift right logical        | `srl $s1, $s2, 3`     | other way to div<br>`s1 = s2 / 2^3`      |                                   |
| Conditional Branch | branch equal               | `beq $s1, $s2, Label` | if true, go to Label                     |                                   |
|                    | branch not equal           | `bne $s1, $s2, Label` | if true (that s1 != s2), go to label     |                                   |
|                    | set on less than           | `$slt $s1, $s2, $s3`  |                                          |                                   |
|                    | set on less than immediate | `$slt $s1, $s2, 100`  |                                          |                                   |
| Unconditional Jump | jump                       | `j LABEL`             |                                          |                                   |
##### Example
```c
int i;
for(i = 0; i < numOfLines; i++){
	int x = i +2; 
	if( x < 3){
		y = i;
	}else{
		y = x;
	}
}
```

```assembly
		move $t0, $zero
Loop:	slt $t1, $t0, $s1    # Check for loop condtition
		beq $t1, $zero, EXIT_LOOP  # branch to exit, else loop
		addi $s2, $t0, 2
		slt $t2, $s2, 3  # Evaluate if condition
		bne $t2, $zero, ELSE  # if condition is false go to else
		move $s3, $t0   # y = i
		addi $t0, $t0, 1  # increment i 
		j Loop
		
	ELSE: 
		move $s3, $s2
		addi $t0, $t0, 1  # increment i
		j Loop
EXIT_LOOP: ...
```
> Note that there are other instructions, especially ones for unsigned numbers.
> Also beware of using `sll/srl` for multipcations/div on signed numbers.