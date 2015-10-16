.data 
stack_beg:
        .word   0 : 40
stack_end:

answer_array: .word 0:10
number:	.word 0
.text

main:
	la $sp, stack_end	
	la $a3,answer_array #a3 will point to the beginning of the array of correct numbers
new_level:
	jal random0
level:
	la $a3, answer_array
	jal display 		#will take in two arguments, the pointer to the array and the level we are on $t6, (0-9)
	jal user_input
	jal check #this needs to go inside user input as it happens multiple times
	beq $a2, 1, youlose
	addi $t7, $t7, 1
	add $t6, $t6, 1
	bne $t6, 11, new_level
youlose:


exit_program:
	li      $v0, 10
        syscall

#takes in the beginning of the array where the answer is stored
#returns random number in $a0
random0:
	addi $sp,$sp,-4
	sw $ra, 4($sp)
	jal adjust_array 	#takes in two arguements, the level we are on (0-9) $t6, and the pointer to the array $a3
	lw $ra, 4($sp)	
	addi $sp,$sp,-8
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
	lw $t0, 0($a3)
	beq $t0,$a0 ,correct
	bne $t0,$a0 ,incorrect
	
correct: 
	li $a2, 0
	j endcheck	
incorrect:
	li $a2, 1
endcheck:
	jr $ra

	
#popinter to the addess of the number to be printed, will later be a color
display:
	#need to make it loop in here based off what evel we are on
	li $v0, 1
	syscall
	addi $sp,$sp,-8
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	jal wait500
	lw $ra, 4($sp)
	lw $a0, 8($sp)
	addi $sp,$sp,8
	jr $ra

user_input:
	#will have to loop and check input for each number ented comparing it to each entry in the string
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

adjust_array:
	beq $t6,0, end_adjust
	beq $t6,1, add4
	beq $t6,2, add8
	beq $t6,3, add12
	beq $t6,4, add16
	beq $t6,5, add20
	beq $t6,6, add24
	beq $t6,7, add28
	beq $t6,8, add32
	beq $t6,9, add36
	
add4:
	add $a3, $a3, 4
	j end_adjust
add8:
	add $a3, $a3, 8
	j end_adjust
add12:
	add $a3, $a3, 12
	j end_adjust
add16:
	add $a3, $a3, 16
	j end_adjust
add20:
	add $a3, $a3, 20
	j end_adjust
add24:
	add $a3, $a3, 24
	j end_adjust
add28:
	add $a3, $a3, 28
	j end_adjust
add32:
	add $a3, $a3, 32
	j end_adjust
add36:
	add $a3, $a3, 36

end_adjust:

	jr $ra