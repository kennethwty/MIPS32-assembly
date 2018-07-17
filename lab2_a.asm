# CSE2304 Lab Section 001L
# TSZ YAN WONG
# Lab 2 Question 2

.data
strInMsg: .asciiz "Please enter a number to convert: "
strOut1: .asciiz "\nConverting the number :"
strOut2: .asciiz "\nC to F is "
strOut3: .asciiz "\nF to C is "

.text

main:

la $a0, strInMsg # ask the user for input
li $v0, 4
syscall

# now read the input from the console
li $v0, 5 #Loads System service to read integer
syscall
move $t0, $v0 #move value to register to save for later use

la $a0, strOut1
li $v0, 4
syscall

move $a0, $t0
li $v0, 1 # output the result using System Service 1
syscall

#calculating the temperature for F
mul $t1, $t0, 9
div $t1, $t1, 5
addi $t1, $t1, 32

la $a0, strOut2
li $v0, 4
syscall

move $a0, $t1
li $v0, 1 # output the result using System Service 1
syscall

#calculating the temperature for C
sub $t2, $t0, 32
mul $t2, $t2, 5
div $t2, $t2, 9

la $a0, strOut3
li $v0, 4
syscall

move $a0, $t2
li $v0, 1 # output the result using System Service 1
syscall

# Now we need to exit our program
li $v0, 10 # Move 10 to register $v0. This is the system service to exit the program.
syscall # exit (Pass control back to the operating system.)