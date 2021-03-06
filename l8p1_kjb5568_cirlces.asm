.data 
stack_beg:
        .word   0 : 40
stack_end:

answer_array: .word 0:10
number:	.word 0
ColorTable:
	.word 0x000000	#black
	.word 0x0000ff	#blue 
	.word 0x00ff00	#green
	.word 0xff0000	#red
	.word 0x00ffff	#blue + green (cyan)
	.word 0xffff00	#blue + red   (magenta) 
	.word 0xffff00	#green +red   (red)
	.word 0xffffff	#white
BoxTable:
	.word '1', 1, 1, 'B'
	.word '2', 17, 1, 'G'
	.word '3', 1, 17, 'R'
	.word '4', 1, 1, 'Y'
you_lose: .asciiz "You lose! :("
you_win: .asciiz "YOU WIN!!"
.text
#################################################################################################
#main loop
##################################################################################################
main:
	la $sp, stack_end
	#jal DrawLines	
	la $a3,answer_array 	#a3 will point to the beginning of the array of correct numbers
new_level:
	add $s0, $s0, 1
	la $a3,answer_array	#loads the address of my array into $a3 as we will/have messed with where that is pointing
	jal random0		#random number generator0, used for all random numbers
				#prints out a new line for readability
	addi $a0,$0,0xA		#char code for a hard return
	li $v0, 11		#print char
	syscall
level:
	#add $s0, $s0, 1
	la $a3,answer_array	#loads the address of my array into $a3 as we will/have messed with where that is pointing
	jal display 		#will take in two arguments, the pointer to the array and the level we are on $s0, (0-9)
	la $a3,answer_array	#loads the address of my array into $a3 as we will/have messed with where that is pointing
	jal user_input		#takes us to where the user inputs numbers, loops internally based off of level
	bne $s0, 5, new_level
youwin: 			#simple procedure for printing out a new line and you win
	addi $a0,$0,0xA
	li $v0, 11
	syscall
	la $a0, you_win
	addiu $v0,$0,4		      
	syscall
exit_program:			#exits the program
	li      $v0, 10
        syscall
##########################################################################
#takes in the beginning of the array where the answer is stored
#returns random number in $a0
#only random number generator in the program
#only one is needed since the random number gnerator is reseeded everytime it is called
###############################################################################
random0:
	li $a0,0
	li $a1,0
	addi $sp,$sp,-4		#moves the stack pointer -4
	sw $ra, 4($sp)		#save $ra to the stack
	jal adjust_array 	#takes in two arguements, the level we are on (0-9) $s0, and the pointer to the array $a3
	lw $ra, 4($sp)		#moves the stack pointer 4
	addi $sp,$sp,-4		#moves the stack pointer -4
	li $v0,30
	syscall
	move $a1,$a0		#seed time is now in $a1
	li $a0,0	#random number generator 0
	li $v0,40	#random number generator 0
	syscall
	li $a1,4	#top range of numbers to generate, in our case 0-3
	li $v0, 42
	syscall
	addi $a0, $a0, 1  #fixes the range of random numbers to be 1-4
	sw $a0,0($a3)	
	jr $ra		#random number is now in $a0

####################################################################
#takes in $a3(where our array is pointing)
#also takes in what was entered $a0
#checks to see if those two match, if so we continue
####################################################################
check:
	lw $t0, 0($a3)
	beq $t0,$a0 ,correct	#branches if the right number was entered
	bne $t0,$a0 ,incorrect	#branches if the righ number was entered
	
correct: 
	j endcheck	#if we are correct then jump and move on
incorrect:
	addi $a0,$0,0xA	#if we are incorrect print a new line and you lose
	li $v0, 11
	syscall
	la $a0, you_lose
	addiu $v0,$0,4	
	syscall
	j exit_program
endcheck:
	jr $ra

######################################################################################	
#pointer to the addess of the number to be printed, will later be a color
#level count is in $s0
#s1 will be local loop counter
######################################################################################
display:
	#need to make it loop in here based off what evel we are on
	li $s1,0	#reset the loop counter for each time we enter the display from main
displayloop:
	addi $sp,$sp,-4	#moves the stack pointer -4
	sw $ra, 4($sp)	#save $ra to the stack
	jal increment_array
	lw $ra, 4($sp)	#moves the stack pointer 4
	addi $sp,$sp,4	#restore $ra from the stack
	lw $a0, 0($a3)
	################################### draw a box
	addi $sp,$sp,-8	#moves the stack pointer -4
	sw $ra, 4($sp)	#save $ra to the stack
	sw $a3, 8($sp)
	sw $a0, 0($sp)
	jal DisplayBox
	lw $a0, 0($sp)
	lw $a3, 8($sp)
	lw $ra, 4($sp)	#moves the stack pointer 4
	addi $sp,$sp,8	#restore $ra from the stack
	######################################### end draw
	#li $v0, 1
	#syscall
	add $s1, $s1, 1
	bne $s1, $s0, displayloop #loop if we still have more input to cover
	addi $a0,$0,0xA		#prints a new line character to make things much more readable
	li $v0, 11
	syscall
	jr $ra


###########################################################################################
#$a3 will be the array where the correct answer is that we are comparing to
#$s0 holds the loop count from the main loop
# will branch to you lose or win from here
#########################################################################################
user_input:
	#will have to loop and check input for each number ented comparing it to each entry in the string
	li $s1, 0
user_inputloop:
	li $v0,12
	syscall
	sub $a0,$v0,48 #corrects the character to integer by subtracting 48
	addi $sp,$sp,-4	#moves the stack pointer -4
	sw $ra, 4($sp)	#save $ra to the stack
	jal increment_array
	lw $ra, 4($sp) #restore $ra from the stack
	addi $sp,$sp,4	#moves the stack pointer 4
	#need to draw a box here
	addiu $sp,$sp, -8
	sw $ra, 4($sp)
	sw $a3, 8($sp)
	jal DisplayBox
	lw $a3, 8($sp)
	lw $ra, 4($sp)
	addiu $sp,$sp, -8
	addi $sp,$sp,-4	#moves the stack pointer -4
	sw $ra, 4($sp)	#save $ra to the stack
	jal check
	lw $ra, 4($sp)	#restore $ra from the stack
	addi $sp,$sp,4	#moves the stack pointer 4
	add $s1, $s1, 1
	bne $s1, $s0, user_inputloop #loops to match the level we are on as determined by the main function
	jr $ra
########################################################################################	
#waits 500 ms...will make more sense when displaying squares, for now just a place holder
#wait function so that we can blink the boxes on the screen
#########################################################################################
wait500:
	li $t0 500
	li $v0,30
	syscall
	move $t1, $a0
	wait500loop:
		syscall
		subu $t2, $a0,$t1
		bltu $t2, $t0, wait500loop
	jr $ra

################################################################################################################
#adjusts the array so that we can load a random number in through each loop
#takes in a pointer to the array $a3
#takes a counter of how much offset from the beginning of the array that the value is going to be stored
##############################################################################################################
adjust_array:
#load counter into $s0
	beq $s0,1, end_adjust
	beq $s0,2, add4
	beq $s0,3, add8
	beq $s0,4, add12
	beq $s0,5, add16
	beq $s0,6, add20

add4:
	add $a3, $a3, 4
	j end_adjust
add8:
	add $a3, $a3, 8
	j end_adjust
add12:
	add $a3, $a3, 12
	j end_adjust
add16:
	add $a3, $a3, 16
	j end_adjust
add20:
	add $a3, $a3, 20
	j end_adjust
end_adjust:
	jr $ra
	

#######################################################
#s1 tells us whether to increment or not
#increments the pointer to the array on $a3
########################################################
increment_array:
	beq $s1,0, end_increment
	bne $s1,0, increment4
	
increment4:
	add $a3, $a3, 4
	j end_increment
end_increment:
	jr $ra
	
	
#############################################################
#Display functions will follow
#############################################################

#############################################################
DisplayBox:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	#a0 has number correlating to box that we need to draw
	add $t0, $a0, 0
	li $a3, 60
	beq $t0, 1, one
	beq $t0, 2, two
	beq $t0, 3, three
	beq $t0, 4, four
	
one:
	li $a0, 0
	li $a1, 8
	li $a2, 6
	j printbox
two:
	li $a0, 78
	li $a1, 88
	li $a2, 1
	j printbox
three:
	li $a0, 0
	li $a1, 158
	li $a2, 2

	j printbox
four:
	li $a0, -78
	li $a1, 88 
	li $a2, 3

printbox:
	addiu $sp,$sp, -24
	sw $a0, 16($sp)
	sw $a1, 12($sp)
	sw $a2, 8($sp)
	sw $a3, 4($sp)
	sw $s0, 20($sp)
	sw $s1, 24($sp)
	jal DrawCircle
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	lw $a2, 8($sp)
	lw $a3, 4($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	addiu $sp,$sp, 24
	addiu $sp,$sp, -20
	sw $a0, 16($sp)
	sw $a1, 12($sp)
	sw $a2, 8($sp)
	sw $a3, 4($sp)
	jal wait500
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	lw $a2, 8($sp)
	lw $a3, 4($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	addiu $sp,$sp, 24
	li $a2, 0
	addiu $sp,$sp, -24
	sw $a0, 16($sp)
	sw $a1, 12($sp)
	sw $a2, 8($sp)
	sw $a3, 4($sp)
	sw $s0, 20($sp)
	sw $s1, 24($sp)
	jal DrawCircle
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	lw $a2, 8($sp)
	lw $a3, 4($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	addiu $sp,$sp, 24
	addiu $sp,$sp, -20
	sw $a0, 16($sp)
	sw $a1, 12($sp)
	sw $a2, 8($sp)
	sw $a3, 4($sp)
	jal wait500
	lw $a0, 16($sp)
	lw $a1, 12($sp)
	lw $a2, 8($sp)
	lw $a3, 4($sp)
	addiu $sp,$sp, 20
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	jr $ra
	




#############################################################
#calc address
#a0 is x coordinate
#a1 is y cooridinate
#$v0 is the address in memory we want to draw our dot 
#############################################################
calcaddress:
	sll $t0, $a0, 2
	sll $t1, $a1, 10
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
	
#################################################################
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

#################################################################
#Circles
#################################################################
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


