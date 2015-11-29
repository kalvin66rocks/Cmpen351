.data

stack_beg:
        .word   0 : 60
stack_end:

ColorTable:
.word 0x000000	#black
.word 0x0000ff	#blue 
.word 0x00ff00	#green
.word 0xff0000	#red
.word 0x00ffff	#blue + green (cyan)
.word 0xffff00	#blue + red   (magenta) 
.word 0xffff00	#green +red   (yellow)
.word 0xffffff	#white



.text
	
	#main triangle
	li $a0, 256
	li $a1, 180
	li $a2, 1
	li $a3, 128
	jal drawtriangle
	
	#three triangles the middle
	#right
	li $a0, 384
	li $a1, 180
	li $a2, 1
	li $a3, 64
	jal drawtriangle
	#left
	li $a0, 128
	li $a1, 180
	li $a2, 1
	li $a3, 64
	jal drawtriangle
	#bottom
	li $a0, 256
	li $a1, 308
	li $a2, 1
	li $a3, 64
	jal drawtriangle
	
	#triangles around the right
	#right
	li $a0, 448
	li $a1, 180
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#left
	li $a0, 320
	li $a1, 180
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#bottom
	li $a0, 384
	li $a1, 244
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#triangles around the left
	#right
	li $a0, 192
	li $a1, 180
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#left
	li $a0, 64
	li $a1, 180
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#bottom
	li $a0, 128
	li $a1, 244
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#triangles around the bottom
	#right
	li $a0, 320
	li $a1, 308
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#left
	li $a0, 192
	li $a1, 308
	li $a2, 1
	li $a3, 32
	jal drawtriangle
	#bottom
	#bottom
	li $a0, 256
	li $a1, 372
	li $a2, 1
	li $a3, 32
	jal drawtriangle
		

exit_program:			#exits the program
	li      $v0, 10
        syscall



#############################################################
#calc address
#a0 is x coordinate
#a1 is y cooridinate
#$v0 is the address in memory we want to draw our dot 
#############################################################
calcaddress:
	sll $t0, $a0, 2
	sll $t1, $a1, 11    #10 for 256, 11 for 512
	add $v0, $t1, $t0
	add $v0, $v0, 0x10040000
	jr $ra
#############################################################
#get color
#uses the vale stored in $a2 to get the color from the color table
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
###############################################################
#draw lines
###############################################################
DrawLines:
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	
	li $a0, 0
	li $a1, 16
	li $a2, 7
	li $a3, 32
	jal HorzLine
	
	li $a0, 16
	li $a1, 0
	li $a2, 7
	li $a3, 32
	jal VertLine
	
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 0
	
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	jr $ra
	
###################################################################
################################################################
#draw a diagonal line Down
################################################################
DiagLineDown:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
DiagLoopDown:
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
	bne   $a3,$0, DiagLoopDown
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
################################################################
#draw a diagonal line Up
################################################################
DiagLineUp:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
DiagLoopUp:
	addiu $sp,$sp, -12
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	jal drawdot
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	addiu $sp,$sp, 12
	addiu $a0,$a0, -1
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, DiagLoopUp
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
	
		
	
##########################################################################################
# draw a triangle
##########################################################################################
drawtriangle:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
TriangleLoop:
	addiu $sp,$sp, -16
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	sw $a3, 16($sp)
	jal DiagLineUp
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	lw $a3, 16($sp)
	addiu $sp,$sp, 16
	addiu $sp,$sp, -16
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	sw $a3, 16($sp)
	jal DiagLineDown
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	lw $a3, 16($sp)
	addiu $sp,$sp, 16
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bnez   $a3,TriangleLoop 
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
	

	
