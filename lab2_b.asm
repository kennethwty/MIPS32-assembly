# CSE2304 Lab Section 001L
# TSZ YAN WONG
# Lab 2 Question 3

.data
strInMsg: .asciiz "Please enter a number to convert: "
strOut1: .asciiz "Enter the Temperature: "
strOut2: .asciiz " is the same as "
strOut3: .asciiz "\n"
strOutC: .asciiz " C"
strOutF: .asciiz " F"

.text
main:

la $a0, strInMsg #ask the user for input
li $v0, 4
syscall
# now read the input from the console
li $v0, 5 #Loads System service to read integer
syscall
move $t0, $v0 #move value to register to save for later use

la $a0, strOut1
li $v0, 4
syscall
# now read the input from the console
li $v0, 12 #Loads System service to read char values
syscall
move $t1, $v0 #move value to register to save for later use

addi $t4, $zero, 70 # F = 70

bne $t1, $t4, Else    #check if they are equal, if not, go to else
#calculating the temperature for C
sub $t2, $t0, 32
mul $t2, $t2, 5
div $t2, $t2, 9

la $a0, strOut3
li $v0, 4
syscall

move $a0, $t0
li $v0, 1 # output the result using System Service 1
syscall

la $a0, strOutF
li $v0, 4 # output the result using System Service 1
syscall

la $a0, strOut2
li $v0, 4
syscall

move $a0, $t2
li $v0, 1 # output the result using System Service 1
syscall

la $a0, strOutC
li $v0, 4 # output the result using System Service 1
syscall

j Exit # go to Exit

Else:
#calculating the temperature for F
mul $t1, $t0, 9
div $t1, $t1, 5
addi $t1, $t1, 32

la $a0, strOut3
li $v0, 4
syscall

move $a0, $t0
li $v0, 1 # output the result using System Service 1
syscall

la $a0, strOutC
li $v0, 4 # output the result using System Service 1
syscall

la $a0, strOut2
li $v0, 4
syscall

move $a0, $t1
li $v0, 1 # output the result using System Service 1
syscall

la $a0, strOutF
li $v0, 4 # output the result using System Service 1
syscall

Exit:
# Now we need to exit our program
li $v0, 10 # Move 10 to register $v0. This is the system service to exit the program.
syscall # exit (Pass control back to the operating system.)