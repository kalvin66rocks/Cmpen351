# line break I got from stack overflow the rest is my code 
.data
StackTop:   .word 0:99
StackBot: 
var0:	    .word 
var1:	    .word 

strPrompt:  .asciiz "Please enter a number " 

.text
main:

la $sp,StackBot 


GetInput:

	#display prompt 
	li $v0,4
	la $a0, strPrompt	        # load address of prompt
	syscall			        # print str prompt
	li $v0,5 	 	        # take in input 
	syscall
	
	la $t0,var0			# load address value to $t0
	sw $v0,	0($t0)			# store $v0 into ram

	addi $s0,$v0,0	                # load $v0 to $s0
	jr $ra
	addi $a1,$v0,0	                # load $v0 to $s0
	
Multnumb:

scarymult:
	move $s3,$0	
	move $s4,$0	
	
	beq $s1,$0, done
	beq $s0,$0, done
	move $s2,$0	
loop:
	andi $t0,$s0,1
	beq $t0,$0, next   #skips if 0
	addu $s3,$s3,$s1   #product += first number
	sltu $t0,$s3,$s1   #catch carryout, either a 0 or 1
	addu $s4,$s4,$t0   #product += carry
	addu $s4,$s4,$s2   #product += second number	
next:
	#shift numbers left
	srl $t0,$s1,31
	sll $s1,$s1,1
	sll $s2,$s2,1
	addu $s2,$s2,$t0
	
	srl $s0,$s0,1	#shift multiplier right
	bne $s0,$0,loop  #go back into our loop	
done: 
	
	jr $ra

