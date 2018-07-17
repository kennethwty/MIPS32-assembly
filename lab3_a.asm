# CSE 2304 Lab 3 - Section 001L
# TSZ YAN WONG
# Problem 2

	.data # Data declaration section
str1: .asciiz "Please Enter an Integer for a: "
str2: .asciiz "Please Enter an Integer for b: "
str3: .asciiz "a^2 – ab + 8a – 10b + 19 = "

	.text
main: #begin the program

	li $v0, 4	#output the string to ask for input
	la $a0, str1
	syscall
	
	li $v0, 5	#get the input for 'a' from the user
	syscall
	move $t0, $v0
	
	li $v0, 4	#output the string to ask for input
	la $a0, str2
	syscall
	
	li $v0, 5	#get the input for 'b' from the user
	syscall
	move $t1, $v0
	
	#now I have two values
	#then push them into the stack
	
	addi $sp, $sp, -8
	sw $t1,4($sp)	#the value for 'b'
	sw $t0,0($sp)	#the value for 'a'
	
	mul $t1, $t1, $t0	#t1 = ab
	mul $t0, $t0, $t0	#t0 = a^2
	sub $t0, $t0, $t1	#t0 = a^2 - ab
	
	#pop a
	lw $t1,0($sp)
	mul $t1, $t1, 8	#t1 = 8a
	addi $sp, $sp, 4
	
	add $t0, $t0, $t1	#t0 = a^2 - ab - 8a
	
	#pop b
	lw $t1,0($sp)
	
	mul $t1, $t1, 10	#t1 = 10b
	sub $t0, $t0, $t1
	addi $t0, $t0, 19
	
	addi $sp, $sp, -4
	
	li $v0, 4	#output
	la $a0, str3
	syscall
	
	move $a0, $t0
	li $v0, 1 # output the result using System Service 1
	syscall
	
	li $v0, 10
	syscall