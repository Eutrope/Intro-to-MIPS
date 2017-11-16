# Program to implement the Dijkstra's GCD algorithm

	.data				# variable declarations follow this line
str1: 	.asciiz "Enter the first integer: "
str2: 	.asciiz "Enter the second integer: "  
result: .asciiz "The gcd of " 
andString: .asciiz " and "
is: .asciiz " is: "            
														
	.text				# instructions follow this line	
	
main:     				# indicates start of code to test gcd the procedure
	li $v0, 4			# Getting the first number
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	addi $a1, $v0, 0		# store first number into a1

	li $v0, 4			# Getting the second number
	la $a0, str2
	syscall	
	
	li $v0, 5
	syscall
	addi $a2, $v0, 0		# store second number into a2

	jal gcd
	addi $s1, $v0, 0		# save the result stored in $v0 to $s1
	
	li $v0, 4			# system call to print results
	la $a0, result
	syscall
	
	li $v0, 1			# printing value of a1
	addi $a0, $a1, 0	
	syscall
	
	li $v0, 4
	la $a0, andString	
	syscall
	
	li $v0, 1			# printing value of a2
	addi $a0, $a2, 0	
	syscall
	
	li $v0, 4
	la $a0, is	
	syscall
	
	li $v0, 10			# Tells the system that the procedure is done
	syscall		
														                    
# ---------------------------------------------------------
# The GCD procedure
# ---------------------------------------------------------

gcd:	     				# the “gcd” procedure
	addi $sp, $sp -12 		# adjusting stack for 3 items
	sw $ra, ($sp)			# save return address of the caller
	sw $a1, 4($sp)			# saving first integer into second position in stack
	sw $a2, 8($sp)			# saving second integer into third position in stack

	beq $a1, $a2, exit		# if base case return gcd(m==n)
	bgt $a1, $a2, ifGreater		# else if 1st > 2nd number return gcd(m-n, n)
	blt $a1, $a2, ifLess		# else if 1st < 2nd number return gcd(m-n, n)

ifGreater:
	subu $a1, $a1, $a2		# m - n
	jal gcd				# recursive call to gcd
	
	lw $ra, ($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	addi $sp, $sp, 12		# pop 3 items off the stack
	jr $ra				
	
ifLess:
	sub $a2, $a2, $a1		# n - m
	jal gcd				# recursive call to gcd
	
	lw $ra, ($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	addi $sp, $sp, 12		# pop 3 items off the stack
	jr $ra				
	
exit:
	addi $v0, $a1, 0		# storing the result into v1, picking a1 because at base case a1 and a2 will be the same
	jr $ra				
