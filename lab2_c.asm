# CSE2304 Lab Section 001L
# TSZ YAN WONG
# Lab 2 Question 4

.data
strInMsg: .asciiz "Please enter an integer: "
strOut1: .asciiz "\nSum of ten numbers: "
strOut2: .asciiz "\nMaximum: "
strOut3: .asciiz "\nMinimum: "
strOut4: .asciiz "\nNumber of negative numbers: "
strOut5: .asciiz "\nNumber of zeros: "
strOut6: .asciiz "\nNumber of positive numbers: "

.align 2 #Make sure that our input data is well aligned
memAddr: .space 40  #Reserved storage of 40 bytes, to store 10 integers (4 bytes each)

.text

main:
	la $t0, memAddr
	add $t3, $zero, $zero #Initialize $t0 to zero
	add $t1, $zero, 10 #Initialize $t1 to ten. This will be our counter
	
	#registers for each output
	addi $t4, $zero, 0  #get the max number
	addi $t5, $zero, 0  #get the min number
	addi $t6, $zero, 0  #num of zero counter
	addi $t7, $zero, 0  #num of positive counter
	addi $t8, $zero, 0  #num of negative counter
	
#read Integer
loop: #begin the loop
	la $a0, strInMsg
	addi $v0, $zero, 4
	syscall

	addi $v0, $zero, 5
	syscall
	sw $v0, 0($t0)
	
	bgt $v0, $t4, max #check whether it is greater than the max value
	blt $v0, $t5, min #check if it is less than the min value
	j next

max:
	add $t4, $zero, $v0
	j next

min:
	add $t5, $zero, $v0
	j next

next:
	beq $v0, $zero, numZero
	bgt $v0, $zero, numPositive
	addi $t8, $t8, 1
	j done_checking
	
numZero:
	addi $t6, $t6, 1
	j done_checking

numPositive:
	addi $t7, $t7, 1
	j done_checking

done_checking:
	addi $t0, $t0, 4
	sub $t1, $t1, 1
	bgtz $t1, loop

loopadd:
	sub $t0, $t0, 4
	lw $t2, 0($t0)
	add $t3, $t3, $t2
	add $t1, $t1, 1
	blt $t1, 10, loopadd
	
	la $a0, strOut1
	li $v0, 4
	syscall
	
	li $v0, 1
	add $a0, $zero, $t3
	syscall
	
end:
	la $a0, strOut2 #max of the numbers
	li $v0, 4
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall
	
	la $a0, strOut3 #min of the numbers
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	la $a0, strOut5 #num of zeros
	li $v0, 4
	syscall
	
	move $a0, $t6
	li $v0, 1
	syscall
	
	la $a0, strOut4 #num of negative numbers
	li $v0, 4
	syscall
	
	move $a0, $t8
	li $v0, 1
	syscall
	
	la $a0, strOut6 #num of positive numbers
	li $v0, 4
	syscall
	
	move $a0, $t7
	li $v0, 1
	syscall
	
	# Now we need to exit our program
	li $v0, 10 # Move 10 to register $v0. This is the system service to exit the program.
	syscall # exit (Pass control back to the operating system.)