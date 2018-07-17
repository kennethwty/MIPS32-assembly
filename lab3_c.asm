# CSE 2304 Lab 3 - Section 001L
# TSZ YAN WONG
# Problem 4

str1: .asciiz "Please Enter a String: "
str2: .asciiz "The string is NOT a palindrome!"
str3: .asciiz "The string IS a palindrome!"
str4: .asciiz "Value returned (0 or 1): "

memAddr: .space 80

	.text
main:
	la $t0, memAddr
	add $t3, $zero, $zero	#Initialize $t0 to zero
	
	#prompt the user for input
	la $a0, str1
	add $v0, $zero, 4
	syscall
	
	