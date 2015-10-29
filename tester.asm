.data 

StackTop:    		.word 0:99
StackBot: 


	
ColorTable:
	
		.word 0x000000		# black 
		.word 0x0000ff		# blue 
		.word 0x00ff00		# green
		.word 0xff0000		# red 
		.word 0x00ffff		# blue + green
		.word 0xff00ff		# blue + red 
		.word 0xffff00		# green + red 
		.word 0xffffff		# white
		
.text 
##########################################################################################################################################################
# everything down here is for lab08 drawing stuffs 
# drawing simply

Main:
	la $sp, StackBot
	
	addi $a0,$0,99
	addi $a1,$0,20
	addi $a2,$0,3
	addi $a3,$0,60
	
	#jal DrawBox
	
	addi $a0,$0,99
	addi $a1,$0,170
	addi $a2,$0,4
	addi $a3,$0,60
	
	#jal DrawBox
	
	addi $a0,$0,20
	addi $a1,$0,100
	addi $a2,$0,6
	addi $a3,$0,60
	
	#jal DrawBox
	
	addi $a0,$0,176
	addi $a1,$0,100
	addi $a2,$0,2
	addi $a3,$0,60
	
	#jal DrawBox
	
	# x 128 circles 
	addi $a0,$0,0
	addi $a1,$0,158
	addi $a2,$0,2
	
	jal DrawCircle
	
	addi $a0,$0,0
	addi $a1,$0,8
	addi $a2,$0,5
	
	jal DrawCircle
	
	# x +/- 78 circles 
	addi $a0,$0,-78
	addi $a1,$0,88
	addi $a2,$0,3
	
	jal DrawCircle
	
	addi $a0,$0,78
	addi $a1,$0,88
	addi $a2,$0,4
	
	jal DrawCircle
	
	#######################################
	addi $a0,$0,64
	addi $a1,$0,64
	addi $a2,$0,5
	addi $a3,$0,128
	
	jal DiagLine
	
	addi $a0,$0,190
	addi $a1,$0,64
	addi $a2,$0,5
	addi $a3,$0,128
	
	jal DiagLine
	
	addi $a0,$0,128
	addi $a1,$0,0
	addi $a2,$0,5
	addi $a3,$0,256
	
	#jal VertLine
	
	addi $a0,$0,0
	addi $a1,$0,128
	addi $a2,$0,5
	addi $a3,$0,256
	
	#jal HorzLine
	
	li $v0,10
	syscall 
	
##########################################################################################################################################################
# CalcAddr 
# $a0 = x coord 
# $a1 = y coord 
# returns 
# $v0 = memory address 

CalcAddr:
	
	sll  $a0,$a0,2 			# mult x by 4 
	sll  $a1,$a1,10			# mult y by 4x256
	add  $v0,$0,0x10040000		# set v0 to the base 
	add  $v0,$v0,$a0		# add the x coord 
	add  $v0,$v0,$a1		# add the y coord 
	
	jr $ra 
	
	
##########################################################################################################################################################
# GetColor
# inputs 
# $a2 = color number (0-7)
# returns 
# $v1 = actual number to write to the display  
	
GetColor: 

	la $t0, ColorTable
	sll $a2,$a2,2		# index x4 is offset 
	addu $a2,$a2,$t0	# base offset 
	lw $v1,0($a2)		# get actual color word 
	
	jr $ra 
	
#########################################################################################################################################################
# DrawDot
# input
# $a0 = x coord
# $a1 = y coord 
# $a2 = color number (0-7)

DrawDot: 
	
	addiu $sp,$sp,-8	# give space for 2 
	sw $ra,4($sp)
	sw $a2,0($sp)
	jal CalcAddr
	lw $a2,($sp)
	sw $v0,($sp)
	jal GetColor
	lw $v0,0($sp)
	sw $v1,($v0)	        # make the dot 
	lw $ra,4($sp)
	addiu $sp,$sp,8
	
	jr $ra 
###########################################################################################################################################################
# HorzLine
# inputs
# $a0 = x coord
# $a1 = y coord 
# $a2 = color number 
# $a3 = length of the line 1-32 

HorzLine:
	addi $sp,$sp,-4		# save ra 
	sw $ra,0($sp)
	
HorzLoop:
	
	addi $sp,$sp,-16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	jal DrawDot		# draw dots based off a registers
	lw $a3,12($sp) 
	lw $a2,8($sp)	
	lw $a1,4($sp)
	lw $a0,0($sp)
	add $a0,$a0,1		# increment x 
	addi $sp,$sp,16
	addiu $a3,$a3,-1
	bne $a3,$0,HorzLoop	# keep looping 
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra

###########################################################################################################################################################
# VertLine
# inputs 
# $a0 = x coord
# $a1 = y coord 
# $a2 = color number 
# $a3 = size of box 1-32 

VertLine:
	addi $sp,$sp,-4		# save ra 
	sw $ra,0($sp)
	
VertLoop:
	
	addi $sp,$sp,-16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	jal DrawDot		# draw dots based off a registers
	lw $a3,12($sp) 
	lw $a2,8($sp)	
	lw $a1,4($sp)
	lw $a0,0($sp)
	add $a1,$a1,1		# increment x 
	addi $sp,$sp,16
	addiu $a3,$a3,-1
	bne $a3,$0,VertLoop	# keep looping 
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra 

###############################################################################################################################################################
# Draw Box 
# inputs 
# $a0 = x coord 
# $a1 = y coord 
# $a2 = color number 
# $a3 = size of the box 

DrawBox:
	
	addi $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)
	move $s0,$a3
	
BoxLoop:

	
	addi $sp,$sp,-16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	jal HorzLine		# draw dots based off a registers
	lw $a3,12($sp) 
	lw $a2,8($sp)	
	lw $a1,4($sp)
	lw $a0,0($sp)		
	addi $sp,$sp,16
	addiu $a1,$a1,1		# increment y coord 
	addiu $s0,$s0,-1        # decrement conuter 
	bne $s0,$0,BoxLoop
	lw $s0,4($sp)
	lw $ra,0($sp)
	addi $sp,$sp,8		# restroe s0 and ra to the stack 
	
	jr $ra	
###########################################################################################################################################################
# VertLine
# inputs 
# $a0 = x coord
# $a1 = y coord 
# $a2 = color number 
# $a3 = size of box 1-32 

ChangeX:			# jump here if x is bigger than 128

	addi $t1,$0,-1
	j DiagLoop
	
DiagLine:

	addi $sp,$sp,-4		# save ra 
	sw $ra,0($sp)
	addi $t0,$0,128
	addi $t1,$0,1
	
	bgt $a0,$t0,ChangeX	# if x is greater that 128 draw the line with a positive slope
	 
DiagLoop:
	
	addi $sp,$sp,-16
	sw $a0,0($sp)
	sw $a1,4($sp)
	sw $a2,8($sp)
	sw $a3,12($sp)
	jal DrawDot		# draw dots based off a registers
	lw $a3,12($sp) 
	lw $a2,8($sp)	
	lw $a1,4($sp)
	lw $a0,0($sp)
	add $a0,$a0,$t1		# increment x by 2  
	add $a1,$a1,1		# increment y
	addi $sp,$sp,16
	addiu $a3,$a3,-1
	bne $a3,$0,DiagLoop	# keep looping 
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra 
###########################################################################################################################################################
# Draw Circle
# inputs 
# $a0 = x coord offset 
# $a1 = y coord offset 
# x coord starts at 128 with a 0 offset 
# y coord starts at 20 with a 0 offset 
# $a2 = color number 
 	
.data

CircleTable:

	.word 128,20,44
	.word 127,20,44
	.word 126,20,44
	.word 125,20,44
	.word 124,21,42
	.word 123,21,42
	.word 122,21,42 ### 3 space 
	.word 121,22,40 
	.word 120,22,40	## left 2 pixels 
	.word 119,23,38
	.word 118,23,38	## left 2 pixels 
	.word 117,24,36 
	.word 116,25,34	
	.word 115,25,34 ## left 2 pixels
	.word 114,26,32 
	.word 113,28,28 ## START of drop 2 y
	.word 112,29,26
	.word 111,31,22 ## drop 2 y 
	.word 110,33,20 ## drop 2 y 
	.word 109,36,14 ## drop 3 y 
	.word 108,38,10 ## drop 2 y 
	
.text 

DrawCircle:

	addi $s4,$a0,0		       	# put x offset in $a0 
	addi $s5, $a1,0			# put y offset in $a1
	addi $s6, $a2,0			# put color in $a2 
	
	addi $s2,$0,0
	
CircleCircle:
	
	la $s0,CircleTable		# put the address of the tbale in a register 
	add $s1,$s2,$0
	mul $s1,$s2,12
	add $s0,$s0,$s1
	
	lw $a0,0($s0)			# x 
	lw $a1,4($s0)			# y
	add $a0,$a0,$s4			# add the x offset 
	add $a1,$a1,$s5			# add the y offset 
	add $a2,$0,$s6			# look up color  
	lw $a3,8($s0)			# length
	
	addi $sp,$sp,-28
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s4,12($sp)
	sw $s5,16($sp)
	sw $s6,20($sp)
	sw $ra,24($sp)
	jal VertLine 
	lw $ra,24($sp)
	lw $s6,20($sp)
	lw $s5,16($sp)
	lw $s4,12($sp)
	lw $s2,8($sp)
	lw $s1,4($sp)
	lw $s0,0($sp)
	addi $sp,$sp,28
	
	addi $s2,$s2,1			# add one to the loop count 
	beq $s2,21,OtherHalf		# after all 21 lines have been draw leave 
	j CircleCircle 
	
OtherHalf:
	
	addi $s2,$0,0
	addi $s3,$0,0			# need this to make the next half 
	
CircleCircle2:

	la $s0,CircleTable		# put the address of the tbale in a register 
	add $s1,$s2,$0
	mul $s1,$s2,12
	add $s0,$s0,$s1
	
	lw $a0,0($s0)			# x 
	add $a0,$a0, $s3		# move the value over to its secound half position 
	lw $a1,4($s0)			# y
	add $a0,$a0,$s4			# add x offset 
	add $a1,$a1,$s5			# add y offset 
	add $a2,$0,$s6			# look up color 
	lw $a3,8($s0)			# length
	
	addi $sp,$sp,-32
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $s4,16($sp)
	sw $s5,20($sp)
	sw $s6,24($sp)
	sw $ra,28($sp)
	jal VertLine 
	lw $ra,28($sp)
	lw $s6,24($sp)
	lw $s5,20($sp)
	lw $s4,16($sp)
	lw $s3,12($sp)
	lw $s2,8($sp)
	lw $s1,4($sp)
	lw $s0,0($sp)
	addi $sp,$sp,32
	
	addi $s3,$s3,2			# add 2 every time 
	addi $s2,$s2,1			# add one to the loop count 
	beq $s2,21,CircleDone		# after all 21 lines have been draw leave 
	j CircleCircle2 
	
CircleDone:
	jr $ra 

	
