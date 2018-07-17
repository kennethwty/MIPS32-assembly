# CSE 2304 Lab 3 - Section 001L
# TSZ YAN WONG
# Problem 3

	.data # Data declaration section
str1: .asciiz "\nThe following value is pushed into the stack: "
str2: .asciiz "\nValue being popped out of the stack: "
str3: .asciiz "\n\nThe stack is empty!"
str4: .asciiz "Begin the program!\n"
str5: .asciiz "\n\nStored 5 values into the stack, now begin popping!\n"
str6: .asciiz "\n\nThe stack is NOT empty right now!"


	.text #begin the program
main: #the main method

	#prepare the stack
	addi $sp, $sp, -20	#for storing 5 values
	
	li $v0, 4
	la $a0, str4
	syscall
	
	jal PUSH
	move $t0, $v0
	
	li $v0, 4
	la $a0, str6
	syscall
	
	li $v0, 4
	la $a0, str5
	syscall
	
	jal POP
	move $t0, $v0
	
	li $v0, 4
	la $a0, str3
	syscall
	
	addi $sp, $sp, 20
	
	jal Exit
	
PUSH:
	li $v0, 4
	la $a0, str1
	syscall
	addi $a0, $zero, 1
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	sw $a0, 16($sp)
	
	li $v0, 4
	la $a0, str1
	syscall
	addi $a0, $zero, 2
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	sw $a0, 12($sp)
	
	li $v0, 4
	la $a0, str1
	syscall
	addi $a0, $zero, 3
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	sw $a0, 8($sp)
	
	li $v0, 4
	la $a0, str1
	syscall
	addi $a0, $zero, 4
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	sw $a0, 4($sp)
	
	li $v0, 4
	la $a0, str1
	syscall
	addi $a0, $zero, 5
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	sw $a0, 0($sp)
	
	li $v0, 0
	jr $ra
	
POP:
	li $v0, 4
	la $a0, str2
	syscall
	
	lw $a0, 0($sp)
	
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall
	
	lw $a0, 4($sp)
	
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall
	
	lw $a0, 8($sp)
	
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall
	
	lw $a0, 12($sp)
	
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall
	
	lw $a0, 16($sp)
	
	li $v0, 1 #output the counter using System Service 1
	syscall
	
	li $v0, 0
	jr $ra
	
ISEMPTY:
	li $v0, 1
	jr $ra
	
ISNOTEMPTY:
	li $v0, 0
	jr $ra
	
Exit:
	li $v0, 10
	syscall