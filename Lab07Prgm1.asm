.data
StackTop:    .word 0:99
StackBot: 

WaitTime: .word 0:100			# used so the program allows the user to see the number for only a certain amount of time 
RandSeq:  .byte 0:5			# will use RandSeq and UserSeq to store each sequence of numbers so they can be compared later 
UserSeq:  .byte 0:5
askSeq:   .asciiz     "Enter the numbers one at a time" 

.text 
###############################################################################################################################################
#P1
la $sp,StackBot 	       		# set the pointer of the stack

Main: 
	
	addiu $a0,$0,1			# pass gen id 
	addiu $a1,$0,4			# pass limit 
	addiu $t0,$0,0			# use this as my count 
	# test for randomness 
loop: 

	addi $sp,$sp,-12		# save arguments to stack care about them all since we j back to main and run it five times 
	sw $t0,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	jal RandNumb	
	lw $a1,8($sp)
	lw $a0,4($sp)
	lw $t0,0($sp)		
	addi $sp,$sp,12			# keep making the fucntion call to get a random number 		
	
	la $a0, WaitTime		# count to 5000
	addiu $a0,$0,3000
	
	addi $sp,$sp,-12		# save arguments to stack care about them all since we j back to main and run it five times 
	sw $t0,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	jal Pause			# let the user see the number for only a certain amount of time
	lw $a1,8($sp)
	lw $a0,4($sp)
	lw $t0,0($sp)		
	addi $sp,$sp,12				
	addi $t0,$t0,1		 
	
	beq $t0,5,AskForSeq			# if we get to 5 branch to done 

	addiu $t1,$0,100		# hard return 100 times to hide the number after a certain time 
		
HideNumb:
	
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB	        #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall	
	subu $t1,$t1,1
	beq $t1,0,loop			# if $t1=0 jump back to main loop 
	
	j HideNumb 			# keep looping utill $t1 goes to 0

AskForSeq:
	
	addi $a0, $0, 0xA 		#ascii code for LF
	addi $v0, $0, 0xB	        #syscall 11 prints the lower 8 bits of $a0 as an ascii character.
	syscall	
	
	la $a0, askSeq			# let the user know to start entering the sequence 
	addiu $v0,$0,4
	syscall 
			
done: 
		
	addiu $v0, $0,10
	syscall 	
###############################################################################################################################################
# RandNumb
# inputs 
# $a0	=  id of generator 
# $a1   =  seed for the generator
#Outputs 
# $a0   =  value of number that was printed 
.data 

NumbIs:	    .asciiz "Remember: " 

.text 
RandNumb:
	
	la $a0,NumbIs			# show them the prompt 
	addiu $v0,$0,4
	syscall
	addiu $v0,$0,42			# syscall to generate random number 
	syscall 
	addiu $v0,$0,1			# print the number 
	syscall
	addiu $v0,$0,30			# get system time for seed 
	syscall 
	move $a1,$a0
	addiu $a0,$0,0			# set the seed in java with system time  
	addiu $v0,$0,40			# syscall for set seed 
	syscall
	
	
	jr $ra
	

###################################################################################################################################################
# Pause 
# inputs 
# $a0	= number of miiseconds to wait 
# outputs 
# none 

Pause:
	
	
	
	
	move $t0, $a0			# save the time out in a temp
	li $v0,30			# get initial time which is now in $a0 and $a1 
	syscall 	
	move $t1,$a0			# put low order in $t1
	
Ploop2:
	
	syscall
	
	subu $t2,$a0,$t1		# current time will be in $a0 $t1 suptracts that number from initial time  
	bltu $t2,$t0,Ploop2 		# loop if the differance of a0 and t1 < timeout argument passed 
	 
	jr $ra 
#####################################################################################################################################################
# confirmSeq
# inputs 
# $a0 = address of generated sequence 
# $a1 = address of user sequnce 
# outputs 
# $a2 = holds address of yes no prompt 
# $a3 = will be a binary number telling main where to jump based off the user gettting teh sequnence correct 

