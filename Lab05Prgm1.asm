# line break I got from stack overflow the rest is my code 
.data
StackTop:    .word 0:99
StackBot: 

var0:	     .word 0
var1:	     .word 4
operator:    .word 0
answer:      .word 0

buffer:      .byte 0:80  

strPrompt:   .asciiz "please enter 1st number: " 
strPrompt2:  .asciiz "please enter 2nd number: "
opSel:       .asciiz "Select Operator: " 
disPrompt:   .asciiz "Result: " 
remainder:   .asciiz "Remander: "  
badInput:    .asciiz "Input invalid " 
.text


	la $sp,StackBot 	       # set the pointer of the stack 
main: 

	la $a0,strPrompt	       # send the first propmt to get input 
	la $a1,var0		       # put first integer in var0	
	la $a2, badInput	       # when the numbers are bad we tell the user with this 
	jal GetInput		       # call GetInput with a0 and a1 being passed to it 

	la $a0, opSel                  # send the operator prompt to GetOperator
	jal GetOperator		       # call GetOperator with a0 as argument 
	
	la $a0,strPrompt2	       # send the 2nd propmt to get input 
	la $a1,var1		       # put 2nd integer in var1
	la $a2,badInput		       # when the numbers are bad we tell the user with this 
	jal GetInput		       # call GetInput with a0 and a1 being passed to it 
	
	
	# put var0 and var1 in $a0 and $a1 respectivly and a2 holds address of answers  
	la $t1, var0
	la $t2, var1 
	la $a2,answer 
	lw $a0,0($t1)
	lw $a1,0($t2)
	
	# compare t0 against all operator ascii values  
	# call respective procedure passing a0 and a1 to it 
	beq $v1,43, AddNumb
	beq $v1,45, SubNumb
	beq $v1,42, MultNumb
	beq $v1,47, DivNumb
####################################################################################################
# jump to here from any input procedures such as getInput of getOperator 
# a3 
badIn:     
	addi $a0,$a2,0                  # send the first propmt to get input 	
	addiu $v0,$0,4	
	syscall        
	j main	
end:	
	
	la $a0, disPrompt		# put display prompt in a0 to pass to displayNumb
	la $t0, answer 			# put answer in a1
	lw $a1,0($t0)			# put value of t0 into al to send to display 
	jal DisplayNumb			# jump to displaynum with a0 and a1 arguments loaded 
	
	j main			        # keep looping 
	
#############################################################################################################################################################
# register list
# inputs 				outputs 
# $a0 holds addres of StrPrompt 1 0r 2  
# $a1 holds addres of var0 or var1     	
# $a2 hold bad input prompt 
# $a3 holds buffer 		
GetInput:

	# clearing the temp registers that handled the decimal number before I enter will also do it when i levae 
	addi $t0,$0,0
	addi $t1,$0,0
	addi $t2,$0,0
	addi $t3,$0,0
	addi $t4,$0,0
	addi $t5,$0,0
	addi $t6,$0,0
	addi $t7,$0,0
			
	# display prompt 
	addiu $v0,$0,4				 # print str prompt
	syscall		
		 
	la $t7,buffer				 # panda said i could la bffer in getinput so im doing that putting in a0 cause I dont care about previous value      
	addi $sp, $sp, -4    			 # decrememnt stack pointer by 4
	sw   $a1, 0($sp)     			 # save a1  to stack to get the address  later 
	
	# get the string from user 	
	addi $v0,$0,8			# get input stirng with syscall 8
	addi $a0,$t7,0			# move buffer to $a0
	addi $a1,$0,80			# put are max length in a1
	syscall
	
	
	lw $a1,0($sp)			# restore al original address value of var0 or var1
	addi $sp, $sp, +4    		# add stack pointer by 4
	addi $t4,$t4,10			# need this ten to move over a decimal spot and i never wana change it so its stying above the loops
	
	# subroutines !!!!!!!	
	##########################################################################
	# subroutine 1
	# registers 
	# input is $a0 
	charToNum:
	
		lb  $t1,0($t7)			# syscall put the string in temp reg 
		add $t7,$t7,1			# advancce the pointer 
		
		addi $t2,$0,0xA
		beq  $t1,$t2,break1 		# if t3 is <cr> get out
		beq  $t1,$0, break1		# if t3 is null get out 
		addi $t2,$0,0x2E		
		beq  $t1,$t2,postPeriod		# if theres a period get out 
	
		# see if $t1 is any value 0-9
		# look to see if t1 holds a valid ascii
		beq $t1,0x30,valid 
		beq $t1,0x31,valid
		beq $t1,0x32,valid
		beq $t1,0x33,valid
		beq $t1,0x34,valid
		beq $t1,0x35,valid
		beq $t1,0x36,valid
		beq $t1,0x37,valid
		beq $t1,0x38,valid
		beq $t1,0x39,valid
		
		
		j badIn 				# if none of the above cases are true we cant havve a valid input so tell the user
	
	############################################################################################################
	# subroutine 2 	
	# come to valid when inputs is digits if I hit the period im not coming back here 	
	# inputs $t3,t6,t0
	valid:
		
		
		sub  $t3,$t1,0x30		# convert ascii to num with 0x30
		beq  $t6,1,MultT31		# multiply t3 by ten and add it to t0
		beq  $t6,2,MultT32		# add t3 to t0 
		bne  $t0,0, t0Mult10 		# if t0 =0 we dont want to multiply it by 10 becuase its the first run			
		add $t0,$t0,$t3			# add the t3 to our running total 
		j charToNum
		
		t0Mult10:
			
			mult $t0, $t4		# if its greater than we have to multiply by ten to keep the implied decimal in order
			mflo $t0		# this is self explanitory get the product out of lo 
			add $t0,$t0,$t3		# add the multiplied t0 with t3
			j charToNum
			
		MultT31:
			
			mult $t3,$t4
			mflo $t3
			add $t0,$t0,$t3
			add $t6,$t6,1
			j charToNum
			
		MultT32:

			add $t0,$t0,$t3
			add $t6,$t6,1
			j charToNum
			
	# jump here to handle all my decimal calculation 
	postPeriod:	
		
		# first we need to multiply $t0 with 100 because we need room for two decimal places 
		# so mult by 10 twice 
		mult $t0,$t4
		mflo $t0
		mult $t0,$t4
		mflo $t0	   		
		
		# set this to one to tell charToNum to multiply t3 by 10 ... one time and only one time 
		addi $t6,$0,1
		# thats all we needed to do here now we can do are stuff as usual 
		
		j charToNum
	break1:
		
		sw $t0,0($a1)			# store the value in var0 or var1
		
		# clearing the temp registers that handled the decimal number before I leave 
		addi $t0,$0,0
		addi $t1,$0,0
		addi $t2,$0,0
		addi $t3,$0,0
		addi $t4,$0,0
		addi $t5,$0,0
		addi $t6,$0,0
		addi $t7,$0,0
		
		jr $ra				# return back to main with input in var0 or var1 depending on which time this was called

###########################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds address of opsel      
		
GetOperator:

	addiu $v0,$0,4		        # display opsel prompt to user 
	syscall				
	addiu $v0,$0,12			# store char input 
	syscall
	addi $v1,$v0,0			# send the operator in v1

	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		#syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	jr $ra 				# return back to main store operator in opsel

######################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds displya prompt	displays the answer to any one of the procedures 
# $a1 holds answer			

DisplayNumb:
	
	addiu $v0,$0,4 		        # print string prompt 
	syscall 
	
	addi $a0,$a1,0			# put $a1 in $a0 
	addiu $v0,$0,1			# print $a0
	syscall 
	
	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB	        #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	j main

######################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds var0		$a2   holds address of answer  
# $a1 holds var1	        
		
AddNumb:
	
	add $t0, $a0,$a1 		# add two arguments return result in a2				# load address of answer to store a2 in 
	sw $t0, 0($a2)			# store a2 in answer
	j end				# jump to display to output result 

######################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds var0		$a2   holds result 
# $a1 holds var1			

SubNumb: 
	
	sub $t0, $a0,$a1		# subtract two arguments return result in a2
	sw $t0, 0($a2)			# store a2 in answer
	j end				# jump to display to output result 

#####################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds fisrt number	$a2   holds address of answer  
# $a1 holds multiplicant 		
	
MultNumb:
		
	addu $t3, $0, $0		#set 0 in $s3
	addu $t4,$0, $0			#set 0 in $s4
	
	add  $t1, $a1, 0		#moves what is in $a1 to $s1
	add  $t5,$a0, 0			#moves what is in $a0 to $s0
	beq  $t1,$0, done
	beq  $t5,$0, done
	move $t2,$0
	
	loop:
		andi $t0,$t5,1
		beq  $t0,$0, next  	#skips if 0
		addu $t3,$t3,$t1   	# adds product to original number 
		sltu $t0,$t3,$t1   	#catch carryout, either a 0 or 1
		addu $t4,$t4,$t0   	#product += carry
		addu $t4,$t4,$t2   	#product += second number
	
	next:
		#shift numbers left
		srl  $t0,$t1,31
		sll  $t1,$t1,1
		sll  $t2,$t2,1
		addu $t2,$t2,$t0
	
		srl $t5,$t5,1	 	#shift multiplier right
		bne $t5,$0,loop  	#go back into our loop
		
	done: 
		add $t6, $t3, 0		#store the result of muliplication in $a2 to be passed out of function
		la $t0, answer 		# load address of answer to store a2 in 
		sw $t6, 0($a2)		# store a2 in answer
		j end			# jump to display to output result of div 

########################################################################################################################################################################
# register list
# inputs 			outputs 
# $a0 holds divaden		$a2   holds address of answer  
# $a1 holds divisor 		$a3   holds remainder 

DivNumb:	
add $v0, $0,$0	#initially goes 0 times
	add $t1,$a1,$0
	j chko
	
oloop: 
	add $t1, $a1,$0 		#divisor multiple starts at 1
	add $t2,$0,1			#initialize temp quotient to 1
	j noqmul
	
inloop:	sll $t2, $t2, 1			#multiply temp quotient by 2

noqmul:	sll $t1, $t1, 1			#multiply divisor by 2
	sltu $t0, $a0, $t1		#if remaining dividend is less than div multiple
	beq $t0, $zero, inloop		#fall through to add temp quotient
	
	addu $v0,$v0,$t2		#add temp quotient to running
	srl $t1,$t1,1			#undo last divisor multiply
	sub $a0,$a0,$t1			#subtract biggest multiple from dividend
	
chko:	
	sltu $t0, $a0,$a1		#set $t0 if $a0 < $a1
	beq $t0,$0,oloop		#repeat until div is calculated
	
	add $t6, $v0, 0			#store result in $t6 to be passed a2
	add $a3, $a0,0			#stores remainder in $a3
	 
	sw $t6,0($a2)			# taking my answer and sending it to memory whith is address word 
	
	la $a0, remainder
	addiu $v0,$0,4		        # display prompt to user 
	syscall	
	
	addi $a0,$a3,0			# print remainder 
	addi $v0, $0,1
	syscall 
	
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		#syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	j end				# jump to display to output result with $a2 as our result
	 	
end2:
