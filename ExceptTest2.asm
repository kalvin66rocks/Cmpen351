.data 

StackTop:    		.word 0:99
StackBot: 


Que: 

	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.text

Main:
	
	la $s0,Que 			# save que 
	lui $t0, 0xFFFF			# $t0 = 0xFFFF0000;
	ori $a0, $0, 2			# enable keyboard interrupt
	sw $a0, 0($t0)			# write back to 0xFFFF0000;
Loop:
		
	lw $a0,0($s0)			# get char 
	li $v0,11
	syscall
	
	j Loop  	
bye: 

	li $v0,10			# we good 
	
.ktext 0x80000180

	move $t0,$s0			# put que address in t0 
	mfc0 $k0,$13			# cause register 
	mfc0 $k1,$14			# EOC
	andi $k0,$k0,0x003c		# and ko and 0x003c 
	bne $k0,$0,NotI0		# if this is zero well then IDK what it is but leave
	
	addi $sp,$sp,-8			# stack stuffs 
	sw $ra,0($sp)
	sw $t0,4($sp)			# save that address 
	jal GetChar			# get char if code is 0 
	lw $ra,0($sp)
	lw $t0,4($sp)			# restore regs 
	addi $sp,$sp,8
	
	sw $v0,0($t0)			# save to que
	addi $t0,$t0,4			# increment que
	
	
	mtc0 $0, $13			# Clear Cause register
	mfc0 $k0, $12			# Set Status register
	andi $k0, 0xfffd		# clear EXL bit
	ori  $k0, 0x11			# Interrupts enabled
	mtc0 $k0, $12			# write back to status

NotI0:

	eret
	

# interupt tester
#############################################################################################################################################
# key board polling 
# CharThere
# erutrns 
# $v0

IsCharThere: 
	
	lui $t0,0xffff			# status register 
	lw $t1,0($t0)			# get control 
	andi $v0,$t1,1			# mask all but read bit 
	jr $ra
#############################################################################################################################################
# key board polling 
# GetChar 
# rutrns 
# $v0 = ascci character 

GetChar: 

	addi $sp,$sp,-4
	sw $ra,0($sp)
	j GoCheck
Cloop:
	
GoCheck: 
	
	jal IsCharThere
	beq $v0,$0,Cloop		# if nothing is there 
	lui $t0,0xffff		
	lw $v0,4($t0)			# char in oxffff0004
	lw $ra,0($sp)
	addi $sp,$sp,4 
	
	jr $ra
################################################################################################################
###################################################################################################################################	

