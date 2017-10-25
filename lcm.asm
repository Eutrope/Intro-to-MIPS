# Program to calculate the least common multiple of two numbers

	.data			# variable declarations follow this line
first: 	.word 10		# the first integer
second: .word 15    		# the second integer   
result: .asciiz "The LCM is: "   
									
	.text			# instructions follow this line												                    
main:     			# indicates start of code to test lcm the procedure
	lw $a1, first
	lw $a2, second
	
	jal lcm			# jump to subroutine 'lcm'
	addi $s1, $v0, 0	# save the result stored in $v0 to $s1
    
	li $v0, 4		# printing some text just to make it look pretty
	la $a0, result
	syscall
    
	li $v0, 1		# printing the results
	addi $a0, $s1, 0	
	syscall
    	
	li $v0, 10		# Tells the system that the procedure is done
	syscall

# ---------------------------------------------------------
#  The LCM procedure
# ---------------------------------------------------------

lcm:	     			# the “lcm” procedure
	lw $t0, second		# setting t0 so the largest of the two numbers, assuming second is always largest
	
while:
				# NTS!!! remainder from division goes into hi
    	div $t0, $a1		# dividing t0 with a1
    	mfhi $t1		# storing the remainder into t1
    	
    	div $t0, $a2		# dividing t0 with a1
    	mfhi $t2		# remainder of this division goes into t2
    	
    	beq $t1, $t2, exit	# if the remainders of t1 and t2 are the same then we found our lcm and exit
    	addi $t0, $t0, 1	# else if the above statement was false then we increment t0 like doing i++
    	
    	j while			# jump back to start of while loop
    	
exit: 
    	addi $v0, $t0, 0 	# storing the value of lcm into v0
    	jr $ra           

									
# End of program
