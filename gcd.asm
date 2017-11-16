# Program to implement the Dijkstra's GCD algorithm

	.data				# variable declarations follow this line
str1: 	.asciiz "Enter the first integer: "
str2: 	.asciiz "Enter the second integer: "  
result: .asciiz "The gcd of " 
andString: .asciiz " and "
is: .asciiz " is: "            
														
	.text				# instructions follow this line	
	
main:     				# indicates start of code to test lcm the procedure
	la $a0, str1			# prompt for first number
	jal consolePrint
	
	li $v0, 5
	syscall
	addi $a1, $v0, 0		# store first number into a1

	la $a0, str2			# prompt for second number
	jal consolePrint

	li $v0, 5
	syscall
	addi $a2, $v0, 0		# store second number into a2
	
	addi $sp, $sp -8		# adjusting stack for 2 items
	sw $a1, 0($sp)			# saving first num
	sw $a2, 4($sp)			# saving second num

	jal gcd				# jump to gcd subroutine
	
	lw $a1, 0($sp)			# pop first number
	lw $a2, 4($sp)			# pop second number
	addi $sp, $sp, 4		# restore stack
	
	la $a0, result
	jal consolePrint		# prints "The gcd of "
	
	li $v0, 1			# printing first number
	addi $a0, $a1, 0	
	syscall
	
	la $a0, andString	
	jal consolePrint		# prints " and "
	
	li $v0, 1			# printing second number
	addi $a0, $a2, 0	
	syscall
	
	la $a0, is			# prints " is: "
	jal consolePrint	
	
	li $v0, 1			# print result of gcd
	addi $a0, $v1, 0	
	syscall
	
	li $v0, 10			# Tells the system that the procedure is done
	syscall		
														                    
# ---------------------------------------------------------
# The GCD procedure
# ---------------------------------------------------------

gcd:	     				# the “gcd” procedure
	addi $sp, $sp -4		# adjusting stack for 3 items
	sw $ra, ($sp)			# save return address of the caller

	beq $a1, $a2, exit		# if base case return gcd(m==n)
	bgt $a1, $a2, ifGreater		# else if 1st > 2nd number return gcd(m-n, n)
	blt $a1, $a2, ifLess		# else if 1st > 2nd number return gcd(m-n, n)

ifGreater:
	subu $a1, $a1, $a2		# m - n
	jal gcd				# recursive call to gcd
	j exit
	
ifLess:
	sub $a2, $a2, $a1		# n - m
	jal gcd				# recursive call to gcd
	j exit
	
exit:
	addi $v1, $a1, 0		# storing the result into v1, picking a1 because at base case a1 and a2 
					# will be the same
	lw $ra, ($sp)		
	addi $sp, $sp, 4		# restore the stack
	jr $ra				# jump back to main

consolePrint:
	li $v0, 4
	syscall
	jr $ra
