# CSE 2304 Lab Section 001L Assignment 1
# Tsz Yan Wong / Tsz Wong

.text
main:

# begin the program
# output str1 to prompt the user for input

la $a0, str1  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0. This is the system service to display string messages
syscall       # system call to output str1

# now read the 1st input, X, from console
li $v0, 5 #Loads System service to read integer
syscall #Integer inputted is saved in register $v0
move $t0, $v0 #move value to register to save for later use

# output str2 to prompt the user for input
la $a0, str2  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0. This is the system service to display string messages
syscall       # system call to output str2

# now read the 2nd input, Y, from console
li $v0, 5 #Loads System service to read integer
syscall #Integer inputted is saved in register $v0
move $t1, $v0 #move value to register to save for later use

# output str3 to prompt the user for input
la $a0, str3
li $v0, 4
syscall       # system call to output str3

# now read the 3rd input, Z, from console
li $v0, 5
syscall
move $t2, $v0

# begin the calculations and output the results for question 1
la $a0, str4  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0
syscall       # system call to output str4

# calculate the result for question 1
add $t3, $t0, $t1 # X+Y first
add $t3, $t3, $t2 # the result of X+Y is added to Z, X+Y+Z
move $a0, $t3
li $v0, 1 # output the result using System Service 1
syscall

# question 2
la $a0, str5  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0
syscall       # system call to output str5

# calculate the result for question 2
add $t3, $t1, $t2 # sum up Y and Z first
sub $t3, $t0, $t3 # X substract (Y+Z)
move $a0, $t3
li $v0, 1 # output the result using System Service 1
syscall

# question 3
la $a0, str6  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0
syscall       # system call to output str6

# calculate the result for question 3
mul $t3, $t1, $t2 # multiply Y by Z
add $t3, $t0, $t3 # X + Y x Z
move $a0, $t3
li $v0, 1 # output the result using System Service 1
syscall

# question 4
la $a0, str7  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0
syscall       # system call to output str7

# calculate the result for question 4
div $t3, $t1, $t2 # Y/Z
sub $t3, $t0, $t3 # X-(Y/Z)
move $a0, $t3
li $v0, 1 # output the result using System Service 1
syscall

# question 5
la $a0, str8  # put the address of the string to display in register $a0
li $v0, 4     # move 4 to the register $v0
syscall       # system call to output str8

# calculate the result for question 5
mul $t3, $t0, $t0 # X square
mul $t3, $t3, $t0 # X cube
mul $t4, $t1, $t1 # Y square
sub $t3, $t3, $t4
move $a0, $t3
li $v0, 1 # output the result using System Service 1
syscall

# Now we need to exit our program
li $v0, 10 # Move 10 to register $v0. This is the system service to exit the program.
syscall # exit (Pass control back to the operating system.)

# data that store the strings needed to prompt the user and display results

.data
str1: .asciiz "Enter the value for X:";
str2: .asciiz "Enter the value for Y:";
str3: .asciiz "Enter the value for Z:";
str4: .asciiz "X + Y + Z = ";
str5: .asciiz "\nX - (Y + Z) = ";
str6: .asciiz "\nX + Y x Z = ";
str7: .asciiz "\nX - (Y/Z) = ";
str8: .asciiz "\n(X^3) - (Y^2) = ";