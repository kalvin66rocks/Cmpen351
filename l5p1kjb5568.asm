# line break I got from stack overflow the rest is my code 
.data
StackTop:    	 .word 0:99
StackBot: 
var0:	     	 .word 0
var1:	     	 .word 4
operator:    	 .word 0
answer:      	 .word 0
remainder:   	 .word 0
buffer:    	 .byte 0:80 
strPrompt:  	 .asciiz "please enter 1st number: " 
strPrompt2: 	 .asciiz "please enter 2nd number: "
opSel:      	 .asciiz "Select Operator: " 
disPrompt:    	 .asciiz "Result: " 
remainderprompt: .asciiz "Remainder: " 
badInput:    	 .asciiz "Input invalid " 

.text
	la $sp,StackBot 	       # set the pointer of the stack 
main: 

	la $a0,strPrompt	       # send the first propmt to get input 
	la $a1,var0		       # put first integer in var0
	la $a2,badInput		       # when non nalid input is detected
	la $a3, buffer		       #loads the buffer that will be used to load in the string of input
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
	la $a2, answer
	la $a3, remainder 
	lw $a0,0($t1)
	lw $a1,0($t2)
	
	# compare t0 against all operator ascii values  
	# call respective procedure passing a0 and a1 to it 
	beq $t0,43, AddNumb
	beq $t0,45, SubNumb
	beq $t0,42, MultNumb
	beq $t0,47, DivNumb
#############################################################################################################################################################	
bad:
	#handling for bad input, can jump here from multiple labels, prompts the user of bad input then sends it back to main
	la $a0,badInput	                # send the first propmt to get input 	
	addiu $v0,$0,4	
	syscall        
	j main	
#############################################################################################################################################################	
end:	
	#handles the displaying of an answer to the user then loops the program so that more calculations may be entered
	la $a0, disPrompt		# put display prompt in a0 to pass to displayNumb
	la $t0, answer 			# put answer in a1
	lw $a1,0($t0)			# put value of t0 into al to send to display 
	jal DisplayNumb			# jump to displaynum with a0 and a1 arguments loaded 
	
	j main			        # keep looping 
	
#############################################################################################################################################################	
GetOperator:
	#gets the operator, division, multiplication, or divison, or invalid character that will be determined later
	addiu $v0,$0,4		        # display opsel prompt to user 
	syscall				
	addiu $v0,$0,12			# store char input 
	syscall
	addi $v1,$v0,0			# send the operator in v1

	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		#syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	jr $ra 	
	 
#############################################################################################################################################################	
GetInput:
	
	addiu $v0,$0,4		        # display prompt to user 
	syscall
	addi $sp,$sp,-4			#decrements the stack pointer 4 so that we can store a word into it
	sw $a1, 0($sp)			#save $a1 to the stack for later use
	addi $v0, 8			#syscall for user to input a string
	addi $a0, $a3,0			#load the buffer into $a0
	addi $a1,$0,80			#maximum length of the string goes into $a1 which is the size of the buffer
	syscall
	
	lw $a1,0($sp)			#restore what was originally in $a1 from the stack
	addi $sp,$sp,4			#increment the stack pointer so that is back in its original position
	addi $t4,$t4,10			#set the decimal place so that there is a tens digit
##########################################################################################	
Character2Number:
	#subroutine that converts the characters to numbers and handles the decimal point
	lb $t1, 0($a3)			#the string will be loaded into here
	add $a3,$a3, 1			#increment the pointer to the buffer by 1
	addi $t2, $0,0xA		#puts the <cr> value int $t2
	beq $t1, $t2,escape		#if the byte in $t3 is a carriage return (enter key) escape
	beq $t1, $0, escape		#if the byte in $t3 is a null character
	addi $t2,$0,0x2E		#puts the period value into $t2
	beq $t1,$t2,period		#branch if there is a period
	
	#checks to to see if the character in $to is a valid number, checks for 0-9 ascending according to their ascii value
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
	
	#else we will know that what is entered is bad input
	j bad
	##########################################################################################
	Valid:
	#subroutine that handles valid characters that are numbers
		sub $t3, $t1, 0x30 		#convert the ascii value to an integer value
		mult $t3,$t4			#move tens digit by multiplying 10
		mflo $t3
		beq $t0,0,nomult
		mult $t0, $t4
		mflo $t0
		add $t0,$t0,$t3
	
		j Character2Number
		##########################################################################################
		nomult:
		#subroutine for handling the first run through so that we do not multiply by 10
		add $t0,$t0,$t3		#put tens digit into $t3 and loop
		j CHaracter2Number
	period:
	#keep looping, this just means we have hit the period
		j Character2Number	
	escape:	
		#have us return to main as all of the characters have been read in
		jr $ra 				# return back to main 

#############################################################################################################################################################	
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
#############################################################################################################################################################		
AddNumb:
	#taking in $a1 and $a2, adds the two numbers together then stores the answer into $a2 which is the address in memory which is then passed out
	
	add $t0, $a0,$a1 		# add two arguments return result in a2
	sw  $t0, 0($a2)
	j end				# jump to display to output result 
#############################################################################################################################################################	
SubNumb: 
	#taking in $a1 and $a2, subtracts the two numbers then stores the answer into $a2 which is the address in memory which is then passed out
	
	sub $t0, $a0,$a1			# subtract two arguments return result in a2
	sw  $t0, 0($a2)
	j end				# jump to display to output result 
#############################################################################################################################################################		
MultNumb:
	#taking in $a1 and $a2, multiplies the two numbers together then stores the answer into $a2 which is the address in memory which is then passed out
	
	addu $t3, $0, $0	#set 0 in $s3
	addu $t4,$0, $0		#set 0 in $s4
	
	add $t1, $a1, 0		#moves what is in $a1 to $s1
	add $t0,$a0, 0		#moves what is in $a0 to $s0
	beq $t1,$0, done
	beq $t0,$0, done
	move $t2,$0
	
loop:
	andi $t7,$t0,1	   #and $t0 with 1 to figure out of to multiply or shift
	beq $t7,$0, next   #skips if 0
	addu $t3,$t3,$t1   #product += first number
	sltu $t7,$t3,$t1   #catch carryout, either a 0 or 1
	addu $t4,$t4,$t7   #product += carry
	addu $t4,$t4,$t2   #product += second number
next:
	#shift numbers left
	srl $t7,$t1,31
	sll $t1,$t1,1
	sll $t2,$t2,1
	addu $t2,$t2,$t7
	
	srl $t0,$t0,1	#shift multiplier right
	bne $t0,$0,loop  #go back into our loop
done: 
	#answer is in $t3
	sw  $t3, 0($a2)
	j end				# jump to display to output result 
	
#############################################################################################################################################################		
DivNumb:
	#taking in $a1 and $a2, divides the two numbers then stores the answer into $a2 and the remainder in $a3 which is the address in memory which is then passed out

	add $t7, $0,$0	#initially goes 0 times
	add $t1,$a1,$0
	j chko
oloop: 
	add $t1, $a1,$0 #divisor multiple starts at 1
	add $t2,$0,1	#initialize temp quotient to 1
	j noqmul
inloop:	sll $t2, $t2, 1	#multiply temp quotient by 2
noqmul:	sll $t1, $t1, 1	#multiply divisor by 2
	sltu $t0, $a0, $t1	#if remaining dividend is less than div multiple
	beq $t0, $zero, inloop	#fall through to add temp quotient
	
	addu $t7,$t7,$t2	#add temp quotient to running
	srl $t1,$t1,1		#undo last divisor multiply
	sub $a0,$a0,$t1		#subtract biggest multiple from dividend
chko:	sltu $t0, $a0,$a1	#set $t0 if $a0 < $a1
	beq $t0,$0,oloop	#repeat until div is calculated
	
	sw  $t7, 0($a2)
	sw  $a0, 0($a3)
	
	la $a0, remainderprompt
	addiu $v0,$0,4		        # display prompt to user 
	syscall	
	
	lw $a0,0($a3)
	addi $v0, $0,1
	syscall 
	
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		 #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	
	j end				# jump to display to output result 
#############################################################################################################################################################		 	