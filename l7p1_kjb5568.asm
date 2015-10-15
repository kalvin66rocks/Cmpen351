.data 
stack_beg:
        .word   0 : 40
stack_end:

answer_array: .word 0:10
.text

main:
	la $sp, stack_end	
	la $a3,answer_array #a3 will point to the beginning of the array of correct numbers
	jal random0
	jal display
	jal user_input
	jal check



exit_program:
	li      $v0, 10
        syscall

#takes in the beginning of the array where the answer is stored
#returns random number in $a0
random0:
	li $v0,30
	syscall
	move $a1,$a0		#seed time is now in $a1
	li $a0,0	#random number generator 0
	li $v0,40	
	syscall
	li $a1,4
	li $v0, 42
	syscall
	sw $a0,0($a3)
	jr $ra		#random number is now in $a0
	
check:
	

	
#popinter to the addess of the number to be printed, will later be a color
display:
	li $v0, 1
	syscall
	addi $sp,$sp,-8
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	jal wait500
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	addi $sp,$sp,8
	jr $ra

user_input:
	li $v0,12
	syscall
	sub $a0,$v0,48 #corrects the character to integer
	jr $ra
	
#waits 500 ms...will make more sense when displaying squares, for now just a place holder
wait500:
	li $t0 500
	li $v0,30
	syscall
	move $t1, $a0
	wait500loop:
		syscall
		subu $t2, $a0,$t1
		bltu $t2, $t0, wait500loop
	
	jr $ra