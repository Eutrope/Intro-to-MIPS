# Program to capitalize the first letter of a string

	.data				# variable declarations follow this line
str: 	.asciiz "Enter the string to capitalize: "
userInput: .space 127                 
														
	.text				# instructions follow this line	
																	                    
main:     				# indicates start of code to test "upper" the procedure
	li $v0, 4			# Prompting the user for input
	la $a0, str
	syscall
	
	li $v0, 8			# Getting the user input
	la $a0, userInput
	li $a1, 127
	syscall

	lb $t1, userInput($t0)		# loading the first byte of the string into $t1
	
	blt $t1, 97, upper		# if the first character is not lowercase we jump to upper procedure
	addi $t1, $t1, -32		# else, we change the first letter to capital letter
	
	sb $t1, userInput($t0)		# store byte back to the position we worked on in the string

	jal upper			# then we jump to the upper procedure

	li $v0, 10			# Tells the system that the procedure is done
	syscall

# ---------------------------------------------------------
# Transforms the first letter of each word to Uppercase
# ---------------------------------------------------------

upper: 					# this loops through the string
	addi $t0, $t0, 0       		# t0 will be the counter starting at 0
	lb $t1, userInput($t0)		# getting the character and loading it into $t1
	
	beq $t1, $zero, exit		# if we reach the end of the string we exit
	beq $t1, 32, capitalize		# if its a space then we go to the capitalize procedure
	addi $t0, $t0, 1		# else we increment the counter $t0 by +1
	
	j upper				# and loop back from upper
	jr $ra

capitalize:				
	addi $t0, $t0, 1		# add +1 since we just came from a space so we need to get the next byte for the char
	lb $t1, userInput($t0)		# retrieving the character from our string at position t0 and loading it into $t1
	
	blt $t1, 97, upper		# if the character is not lowercase then we go back to the loop (upper)
	addi $t1, $t1, -32		# else we change the letter to its capital by -32 to it
	
	sb $t1, userInput($t0)		# putting the changed value back to its position in the string
	j upper				# continue looping through string to find next word
	
exit:					# prints the result of our procedure
	li $v0,4
	la $a0, userInput
	syscall

       								
# End of program
