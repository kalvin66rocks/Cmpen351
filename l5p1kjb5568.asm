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
remainderprompt: .asciiz " Remainder: " 
badInput:    	 .asciiz "Input invalid " 

.text
	la $sp,StackBot 	       # set the pointer of the stack since we are defining our own stack, as it is proper procedure
##########################################################################################################
#this is the main function that branches out to each other subroutine/label
main: 

	la $a0,strPrompt	       # send the first propmt to get input 
	la $a1,var0		       # put first integer in var0
	la $a2,badInput		       # when non nalid input is detected
	jal GetInput		       # call GetInput with a0 and a1 being passed to it 

	la $a0, opSel                  # send the operator prompt to GetOperator
	jal GetOperator		       # call GetOperator with a0 as arguments 
	
	la $a0,strPrompt2	       # send the 2nd propmt to get input 
	la $a1,var1		       # put 2nd integer in var1
	la $a2,badInput
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
	beq $v1,43, AddNumb
	beq $v1,45, SubNumb
	beq $v1,42, MultNumb
	beq $v1,47, DivNumb
#############################################################################################################################################################	
#handling for bad input, can jump here from multiple labels, prompts the user of bad input then sends it back to main
#enables us to continue even in the case of invalid input
bad:
	#handling for bad input, can jump here from multiple labels, prompts the user of bad input then sends it back to main
	addi $a0,$a2,0 	                # send the first propmt to get input 	
	addiu $v0,$0,4	
	syscall        
	j main	
#############################################################################################################################################################	
#handles the displaying of an answer to the user then loops the program so that more calculations may be entered
#also enables us to loop back through to main
end:	
	#handles the displaying of an answer to the user then loops the program so that more calculations may be entered
	la $a0, disPrompt		# put display prompt in a0 to pass to displayNumb
	la $t0, answer 			# put answer in a1
	la $t1, remainder
	lw $a1,0($t0)			# put value of t0 into al to send to display 
	lw $a2,0($t1)
	jal DisplayNumb			# jump to displaynum with a0 and a1 arguments loaded 
	
	j main			        # keep looping 
	
#############################################################################################################################################################
#Registers
#inputs					Outputs	
#   $a0(operation prompt)		$v1(operator)
#
#gets the operator, division, multiplication, or divison, or invalid character that will be determined later
GetOperator:
	#gets the operator, division, multiplication, or divison, or invalid character that will be determined later
	addiu $v0,$0,4		        # display operation select prompt to user 
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
#Registers
#inputs					Outputs	
#   $a0(strprompt)			$a1(var0)
#   $a1(var0)
#   $a2(badinput)
#   
#gets the numeric input the user entered and stores it into memory
GetInput:
	#clear registers to be used within function, was causing errors before
	addi $t0,$0,0
	addi $t1,$0,0
	addi $t2,$0,0
	addi $t3,$0,0
	addi $t4,$0,0
	addi $t5,$0,0
	addi $t6,$0,0
	addi $t7,$0,0
	
	
	addiu $v0,$0,4		        # display prompt to user 
	syscall
	
	la $t7,buffer			#load buffer into $t7
	addi $sp,$sp,-4			#decrements the stack pointer 4 so that we can store a word into it
	sw $a1, 0($sp)			#save $a1 to the stack for later use
	
	addi $v0,$0, 8			#syscall for user to input a string
	addi $a0, $t7,0			#load the buffer into $a0
	addi $a1,$0,80			#maximum length of the string goes into $a1 which is the size of the buffer
	syscall
	
	lw $a1,0($sp)			#restore what was originally in $a1 from the stack
	addi $sp,$sp,4			#increment the stack pointer so that is back in its original position
	addi $t4,$t4,10			#set the decimal place so that there is a tens digit
		
	Character2Number:
	#subroutine that converts the characters to numbers and handles the decimal point
	lb $t1, 0($t7)			#the string will be loaded into here
	add $t7,$t7, 1			#increment the pointer to the buffer by 1
	
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
	
	valid:
		#subroutine that handles valid characters that are numbers
		sub $t3, $t1, 0x30 		#convert the ascii value to an integer value
		beq  $t6,1,MultT31		# multiply t3 by ten and add it to t0 if our counter is equal to 1
		beq  $t6,2,Addt0t3		# add $t0 to $t3 if our counter is equal to 2
		bne  $t0,0, nomult 		# if t0 is equal to 0 we dont want to multiply it by 10 becuase its our first run			
		add $t0,$t0,$t3			# add the t3 to our running total 
		j Character2Number
		
		nomult:
			mult $t0, $t4		# if its greater than we have to multiply by ten to keep the implied decimal in order
			mflo $t0		
			add $t0,$t0,$t3			# add the multiplied t0 with t3
			j Character2Number
			
		MultT31:
			mult $t3,$t4	#multiply t3, by t4
			mflo $t3	#product goes into $t3
			add $t0,$t0,$t3	#add $t3 and $t0 which is our running total
			add $t6,$t6,1	#increment the counter
			j Character2Number
			
		Addt0t3:
			add $t0,$t0,$t3		#adds $t0 and $t3 since we do not want to multiply in this case, which is our running total
			add $t6,$t6,1	#increment the counter
			j Character2Number
	#subroutine to handle the two spots that we hit after we hit the period
	period:
		#need to handle room to put in the cents
		mult $t0,$t4
		mflo $t0
		mult $t0,$t4
		mflo $t0
		
		#need a counter to only do multiplication once
		addi $t6,$0,1
		j Character2Number
	#escape function from reading in data from whenever we hit a null character or a <cr>	
	escape:	
		#store the input before we return to main as all of the characters have been read in
		sw $t0,0($a1)
		
		#clear registers that I used used within function, was causing errors before
		addi $t0,$0,0
		addi $t1,$0,0
		addi $t2,$0,0
		addi $t3,$0,0
		addi $t4,$0,0
		addi $t5,$0,0
		addi $t6,$0,0
		addi $t7,$0,0
		
		jr $ra 				# return back to main 

#############################################################################################################################################################	
#Registers
#inputs					Outputs
#  $a1(answer)				display
#  $a2(remainder[only for divide])
#  $v1(operator) --this might not be the best way to pass this
#takes in the answer and is able to output it as a number in implied decimal point
DisplayNumb:
	
	addiu $v0,$0,4 		        # print string prompt 
	syscall 
	
	addi $t6,$t6,100	#stores 100 in $t1 for dividng by for proper printout since it used throughout the entire subroutine
	#use the operator to determine how to handle the answer
	beq $v1,43, PrintAddSub
	beq $v1,45, PrintAddSub
	beq $v1,42, PrintMult
	beq $v1,47, PrintDiv
	
	#subroutine for correctly printing added or subtracted numbers
	PrintAddSub:
	div $a1,$t6 #PrintAddSub
	mflo $t2    #quotient, dollars
	mfhi $t3    #remainder, cents
	beq $t2,0,nomultadd	#checks to see if our quotient would be 0, if so we branch
	addi $v0,$0,1
	addi $a0,$t2,0
	syscall
	#using print character, print the period
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	syscall
	addi $v0,$0,1
	addi $a0,$t3,0
	syscall
	beq $t3,0,extrazero	#branches to print out an extra 0 if we would only have one decimal place
	j endofprint
	
	#subroutine for correctly printing small added numbers
	nomultadd:
	addi $v0,$0,1 #nomultadd
	addi $a0,$a1,0
	syscall
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	j endofprint
	
	#subroutine for correctly printing multiplied numbers
	PrintMult:
	div $a1,$t6 #PrintMult
	mflo $t2    #quotient, dollars
	mfhi $t3    #remainder, cents
	beq $t2,0, nmultdisp  #checks to see if our quotient would be 0, if so we branch
	div $a1,$a1,100
	div $a1,$t6
	mflo $t4    #quotient, dollars
	mfhi $t5    #remainder, cents
	addi $v0,$0,1
	addi $a0,$t4,0
	syscall
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	syscall
	addi $v0,$0,1
	addi $a0,$t5,0
	syscall
	beq $t5,0,extrazero #branches to print out an extra 0 if we would only have one decimal place
	j endofprint
	
	#subroutine to print out an extra 0 then jump to the end of print subroutine
	extrazero:
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	j endofprint
	
	#subroutine for correctly printing small multiplied numbers
	nmultdisp:
	addi $v0,$0,1 #nmultdisp
	addi $a0,$a1,0
	syscall
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	j endofprint
	
	#subroutine for correctly printing divided numbers, both the quotient and remainder are printed
	PrintDiv:
	addi $v0,$0,1 #PrintDiv
	addi $a0,$a1,0
	syscall
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	#next two systems calls each print a 0 since we need the answer to be in implied decimal and we know that the answer will be whole
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	la $a0,remainderprompt		#prints the prompt for the remainder since it is only used once
	addiu $v0,$0,4 		        # print remainder text 
	syscall 
	div $t5,$a2,100
	addi $v0,$0,1
	addi $a0,$t5,0
	syscall
	addi $v0,$0,11
	addi $a0,$0,0x2E	#loads a period into $a0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	addi $v0,$0,1
	addi $a0,$0,0
	syscall
	
	
	
	#label for everything to jump to so that we can print a hard return everytime we print an answer
	endofprint:	
	# hard return
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB		 #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall
	
	j main
#############################################################################################################################################################
#Registers
#inputs					Outputs
# $a1 					$a2 (sum)
# $a0 	
#taking in $a1 and $a2, adds the two numbers together then stores the answer into $a2 which is the address in memory which is then passed out	
AddNumb:
	
	add $t0, $a0,$a1 		# add two arguments return result in a2
	sw  $t0, 0($a2)
	j end				# jump to display to output result 
#############################################################################################################################################################
#Registers
#inputs					Outputs
# $a1 					$a2 (difference)
# $a0 
#taking in $a1 and $a2, subtracts the two numbers then stores the answer into $a2 which is the address in memory which is then passed out	
SubNumb: 
	
	sub $t0, $a0,$a1			# subtract two arguments return result in a2
	sw  $t0, 0($a2)
	j end				# jump to display to output result 
#############################################################################################################################################################
#Registers
#inputs					Outputs
# $a1 					$a2 (product)
# $a0
#taking in $a1 and $a2, multiplies the two numbers together then stores the answer into $a2 which is the address in memory which is then passed out 	
MultNumb:
	
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
#Registers
#inputs					Outputs
# $a1 (divisor)				$a2 (quotient)
# $a0 (dividend)			$a3 (remainder)
#taking in $a1 and $a2, divides the two numbers then stores the answer into $a2 and the remainder in $a3 which is the address in memory which is then passed out
#derived in class and adapted to work in this program as our own divide		
DivNumb:
	beq $a1,0,bad  #handles division by 0, which takes back into input first number
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
	
	#la $a0, remainderprompt
	#addiu $v0,$0,4		        # display prompt to user 
	#syscall	
	#lw $a0,0($a3)
	#addi $v0, $0,1
	#syscall 
	#addi $a0, $0, 0xA 		#ascii code for LF
	#addi $v0, $0, 0xB		 #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	#syscall
	
	
	j end				# jump to display to output result 
#############################################################################################################################################################		 	
