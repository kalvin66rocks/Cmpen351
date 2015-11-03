.data
stack_beg:
        .word   0 : 40
stack_end:
unsorted_array: .float 0.0:20
sorted_array: 	.float 0.0:20
total:		.float 0.0
number: 	.float 5.0

prompt: .asciiz "Enter the number of floats to enter"


.text
	la $t0, unsorted_array
	la $a0, prompt
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	mtc1 $t1, $f8
	cvt.s.w $f5, $f8
Loop:
	li $v0,6
	syscall
	swc1 $f0, 0($t0)
	addiu $t0, $t0, 4
	addiu $t1, $t1, -1
	add.s $f10, $f10, $f0
	bnez $t1, Loop
###################################################################
	mov.s $f12, $f10
	li $v0, 2
	syscall
######################################
####Average
	div.s $f6, $f10, $f5
	addi $a0,$0,0xA		#print a new line and you lose
	li $v0, 11
	syscall
	mov.s $f12, $f6
	li $v0, 2
	syscall
#######################################
	
	li $v0, 10
	syscall

