# line break I got from stack overflow the rest is my code 
.data
StackTop:    .word 0:99
StackBot: 
var0:	     .word 0
var1:	     .word 4
operator:    .word 
answer:      .word 

strPrompt:   .asciiz "please enter 1st number: " 
strPrompt2:  .asciiz "please enter 2nd number: "
opSel:       .asciiz "Select Operator: " 
disPrompt:    .asciiz "Result: " 

.text


	la $sp,StackBot 	       # set the pointer of the stack 
main: 

	la $a0,strPrompt	       # send the first propmt to get input 
	la $a1,var0		       # put first integer in var0		       
	jal GetInput		       # call GetInput with a0 and a1 being passed to it 

	la $a0, opSel                  # send the operator prompt to GetOperator
	jal GetOperator		       # call GetOperator with a0 as arguments 
	
	addiu $t0,$v1,0		       # return value of GetOperator will go into t0
	
	la $a0,strPrompt2	       # send the 2nd propmt to get input 
	la $a1,var1		       # put 2nd integer in var1
	jal GetInput		       # call GetInput with a0 and a1 being passed to it 
	
	
	# put var0 and var1 in $a0 and $a1 respectivly 
	la $t1, var0
	la $t2, var1 
	lw $a0,0($t1)
	lw $a1,0($t2)
	
	# compare t0 against all operator ascii values  
	# call respective procedure passing a0 and a1 to it 
	beq $t0,43, AddNumb
	beq $t0,45, SubNumb
	beq $t0,42, MultNumb
	beq $t0,47, DivNumb

bad:
	
	la $a0,badInput	                # send the first propmt to get input 	
	addiu $v0,$0,4	
	syscall        
	j main	
end:	
	
	la $t0, answer 			# load address of answer to store a2 in 
	sw $a2, 0($t0)			# store a2 in answer
	
	la $a0, disPrompt		# put display prompt in a0 to pass to displayNumb
	la $t0, answer 			# put answer in a1
	lw $a1,0($t0)			# put value of t0 into al to send to display 
	jal DisplayNumb			# jump to displaynum with a0 and a1 arguments loaded 
	
	j main			        # keep looping 
	
#############################################################################################################################################################	
GetInput:

	#display prompt 
	addiu $v0,$0,4			# print str prompt
	syscall			       
	addiu $v0,$0,5 	 	        # take in input 
	syscall			      
	sw $v0,	0($a1)			# store $v0 into memory
	
	jr $ra				# return back to main 

GetOperator:
	
	addiu $v0,$0,4		        # display prompt to user 
	syscall				
	addiu $v0,$0,12			# store input 
	syscall
	addi $v1,$v0,0			# send the operator in v1

	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		 #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	jr $ra 				# return back to main 


DisplayNumb:
	
	addiu $v0,$0,4 		        # print string prompt 
	syscall 
	
	addi $a0,$a1,0			# put $a1 in $a0 
	addiu $v0,$0,1			# print $a0
	syscall 
	
	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		 #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	j main
	
AddNumb:
	
	add $a2, $a0,$a1 		# add two arguments return result in a2
	j end				# jump to display to output result 

SubNumb: 
	
	sub $a2, $a0,$a1			# subtract two arguments return result in a2
	j end				# jump to display to output result 
	
MultNumb:
	
	# put multipler code here 
	
	addu $s3, $0, $0	#set 0 in $s3
	addu $s4,$0, $0		#set 0 in $s4
	
	add $s1, $a1, 0		#moves what is in $a1 to $s1
	add $s0,$a0, 0		#moves what is in $a0 to $s0
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
	add $a2, $s3, 0		#store the result of muliplication in $a2 to be passed out of function
	j end				# jump to display to output result 
	
DivNumb:

	add $v0, $0,$0
	add $t1,$a1,$0
	j chko
	
oloop: 
	add $t1, $a1,$0
	add $t2,$0,1
	j noqmul
	
inloop:	sll $t2, $t2, 1
noqmul:	sll $t1, $t1, 1
	sltu $t0, $a0, $t1
	beq $t0, $zero, inloop
	
	addu $v0,$v0,$t2
	srl $t1,$t1,1
	sub $a0,$a0,$t1
chko:	sltu $t0, $a0,$a1
	beq $t0,$0,oloop
	
	add $a2, $v0, 0
	
	j end				# jump to display to output result 
	 	
end2:
