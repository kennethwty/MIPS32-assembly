# CSE2304 Lab Section 001L
# TSZ YAN WONG
# Lab 5

.data
	#pre-defined array, you can change the numbers here, buy only integers
	array:  .word   65, 2, 42, -55, 12, 1, -4, 69, 101, 8
	
	use_comma:  .asciiz ", "
	str1:	.asciiz "The following is a list of 10 integers that will be soon sorted by the Quicksort algorithm."
	str2:	.asciiz "\nYou may feel free to change the values (only 10) in the file to see if the algorithm still works.\n\n"
	newline:	.asciiz "\n\n"
	str3:	.asciiz "The sorted values are as follows:\n\n"
	empty_space:	.asciiz ", "

	.align 4	# Make sure that our input data is well aligned
	memAddr:	.space 80

.text
main:

  li $v0, 4
  la $a0, str1
  syscall
  
  li $v0, 4
  la $a0, str2
  syscall
  
  #ready to print the elements of the array to the console
  la $t3, array			#1st element
  li $t2, 0
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#2nd element
  li $t2, 1
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#3rd element
  li $t2, 2
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#4th element
  li $t2, 3
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#5th element
  li $t2, 4
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#6th element
  li $t2, 5
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#7th element
  li $t2, 6
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#8th element
  li $t2, 7
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#9th element
  li $t2, 8
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, empty_space
  syscall
  
  la $t3, array			#10th element
  li $t2, 9
  add $t2, $t2, $t2
  add $t2, $t2, $t2
  add $t1, $t2, $t3
  lw $t4, 0($t1)
  
  move $a0, $t4
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, newline
  syscall
  
  li $v0, 4
  la $a0, str3
  syscall
	
  la    $a0, array            
  addi  $a1, $zero, 0       
  addi  $a2, $zero, 9        
  jal   quick_sort               

  la    $a0, array
  addi  $a1, $zero, 0
  addi  $a2, $zero, 9
  jal print

  li    $v0, 10               
  syscall                     #exit system call

quick_sort:
  addi  $sp, $sp, -4          
  sw    $ra, 0($sp)           

  slt   $t0, $a1, $a2         
                              
  beq   $t0, $zero, resume  
  sll   $t0, $a1, 2           
  add   $t0, $a0, $t0         
  lw    $t1, 0($t0)            
  add   $t2, $a1, $a2         
  srl   $t2, $t2, 1           
  sll   $t2, $t2, 2          
  add   $t2, $a0, $t2       
  lw    $t3, 0($t2)          
  sw    $t3, 0($t0)          
  sw    $t1, 0($t2)          
  sll   $t1, $a1, 2          
  add   $t1, $a0, $t1        
  lw    $t1, 0($t1)         

  add   $t0, $zero, $a1       
  add   $t2, $zero, $a1      

loop:
  addi  $t2, $t2, 1           
  slt   $t3, $a2, $t2         
  bne   $t3, $zero, partition
  sll   $t3, $t2, 2           
  add   $t3, $a0, $t3         
  lw    $t4, 0($t3)           
  slt   $t5, $t4, $t1         
  beq   $t5, $zero, loop      

  addi  $t0, $t0, 1          
  sll   $t5, $t0, 2          
  add   $t5, $a0, $t5       
  lw    $t6, 0($t5)         
  sw    $t4, 0($t5)         
  sw    $t6, 0($t3)         
  j	loop                

partition:
  sll   $t3, $a1, 2           
  add   $t3, $a0, $t3         
  sll   $t5, $t0, 2           
  add   $t5, $a0, $t5         
  lw    $t6, 0($t5)          
  sw    $t6, 0($t3)           
  sw    $t1, 0($t5)          
  addi  $sp, $sp, -12        
  sw    $a2, 8($sp)         
  sw    $a1, 4($sp)         
  sw    $t0, 0($sp)         

  add   $a2, $zero, $t0      
  addi  $a2, $a2, -1          
  jal   quick_sort                
  lw    $t0, 0($sp)           
  lw    $a1, 4($sp)          
  lw    $a2, 8($sp)          
  addi  $sp, $sp, 12     #restore the stock     
  add   $a1, $zero, $t0       
  addi  $a1, $a1, 1           
  jal   quick_sort                

resume:
  lw    $ra, 0($sp)           
  addi  $sp, $sp, 4           

  jr    $ra

print:
  add   $t0, $zero, $a0       
  add   $t1, $zero, $a1 
  
print_loop:
  slt   $t2, $a2, $t1         
  bne   $t2, $zero, end  
  sll   $t2, $t1, 2           
  add   $t3, $t0, $t2         
  lw    $a0, 0($t3)           
  li    $v0, 1               
  syscall                    
  la    $a0, use_comma           
  li    $v0, 4               
  syscall                    
  addi  $t1, $t1, 1         
  j     print_loop                 

end:
  li    $v0, 4		#print a couple new lines and then ready to end the program
  la    $a0, newline
  syscall
  jr    $ra                 