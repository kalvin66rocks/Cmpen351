.data 
stack_beg:
        .word   0 : 40
stack_end:

ColorTable:
.word 0x000000	#black
.word 0x0000ff	#blue 
.word 0x00ff00	#green
.word 0xff0000	#red
.word 0x00ffff	#blue + green
.word 0xffff00	#blue + red
.word 0xffff00	#green +red
.word 0xffffff	#white

.text 
	addi $a0, $a0, 5
	addi $a1, $a1, 5
	addi $a2, $a2, 3
	jal drawdot

exit_program:			#exits the program
	li      $v0, 10
        syscall


#############################################################
#calc address
#############################################################
calcaddress:
	sll $t0, $a0, 2
	sll $t1, $a1, 7
	add $v0, $t1, $t2
	add $v0, $v0, 0x10040000
	jr $ra
#############################################################
#get color
#############################################################
getcolor:
	la $t0, ColorTable
	sll $a2, $a2,2
	addu $a2, $a2, $t0
	lw $v1, 0($a2)
	jr $ra
#############################################################
#draw a dot
#############################################################
drawdot:
	addiu $sp,$sp, -8
	sw $ra, 4($sp)
	sw $a2, 0($sp)
	jal calcaddress
	lw $a2, 0($sp)
	sw $v0, 0($sp)
	jal getcolor
	lw $v0, 0($sp)
	sw $v1, ($v0)
	lw $ra, 4($sp)
	addiu $sp,$sp, 8
	jr $ra
#############################################################