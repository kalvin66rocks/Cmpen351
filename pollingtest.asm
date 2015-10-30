.data 
stack_beg:
        .word   0 : 60
stack_end:

queue:
	.word 0: 10


ColorTable:
.word 0x000000	#black
.word 0x0000ff	#blue 
.word 0x00ff00	#green
.word 0xff0000	#red
.word 0x00ffff	#blue + green (cyan)
.word 0xffff00	#blue + red   (magenta) 
.word 0xffff00	#green +red   (yellow)
.word 0xffffff	#white



.ktext 0x80000180

move $k0, $a0
move $k1, $v0
lui $t0, 0xffff
lw  $v0, 4($t0)
la $t1,queue
mul $s0, $s0, 4
add $t1, $s0, $t1
sw $v0, 0($t1)
move $a0, $v0	#just for testing
li $v0, 11	#just for testing
syscall		#just for testing
#jal GetChar
addi $s0, $s0, 1
move $a0, $k0
move $v0, $k1
mtc0 $0, $13
eret 

   .kdata	
msg:   
   .asciiz "Trap generated"

.text

lui $t0, 0xffff
ori $a0, $0, 2
sw $a0, 0($t0)
main:

#jal GetChar
li $a0, 3
li $a1, 3
li $a2, 1
li $a3, 40
jal DrawBox
li $a0, 3
li $a1, 3
li $a2, 2
li $a3, 40
jal DrawBox
li $a0, 3
li $a1, 3
li $a2, 3
li $a3, 40
jal DrawBox
beq $a0, 57, exit_program
j main

exit_program:			#exits the program
	li      $v0, 10
        syscall
###########################################################
#functions
###########################################################
IsCharThere:
	lui $t0,0xffff
	lw $t1, 0($t0)
	andi $v0, $t1, 1
	jr $ra

GetChar:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	j gocheck
	
cloop:  #sleep
gocheck:
	jal IsCharThere
	beq $v0, $0, cloop
	lui $t0, 0xffff
	lw $v0, 4($t0)
	lw $ra,0($sp)
	addiu $sp, $sp, 4
	move $a0, $v0	#just for testing
	li $v0, 11	#just for testing
	syscall		#just for testing
	jr $ra
	
	
#############################################################
#calc address
#############################################################
calcaddress:
	sll $t0, $a0, 2
	sll $t1, $a1, 10
	add $v0, $t1, $t0
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
#draw a horizontal line
#############################################################
HorzLine:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
HorzLoop:
	addiu $sp,$sp, -12
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	jal drawdot
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	addiu $sp,$sp, 12
	addiu $a0,$a0, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, HorzLoop
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra

	
#############################################################
#draw a vertical line
#############################################################
VertLine:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
VertLoop:
	addiu $sp,$sp, -12
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	jal drawdot
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	addiu $sp,$sp, 12
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, VertLoop
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
		

#############################################################
#draw a box
#############################################################
DrawBox:
	add $s2, $a3, 0
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
BoxLoop:
	addiu $sp,$sp, -20
	sw $a0, 16($sp)
	sw $a1, 12($sp)
	sw $a2, 8($sp)
	sw $a3, 4($sp)
	jal HorzLine
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	lw $a2, 8($sp)
	lw $a3, 4($sp)
	addiu $sp,$sp, 20
	addiu $a1, $a1, 1
	addiu $s2,$s2,-1
	bne $s2,$0, BoxLoop
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
################################################################
#draw a diagonal line
################################################################
DiagLine:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
DiagLoop:
	addiu $sp,$sp, -12
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	jal drawdot
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	addiu $sp,$sp, 12
	addiu $a0,$a0, 1
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, DiagLoop
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
