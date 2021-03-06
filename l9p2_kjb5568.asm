.data
stack_beg:
        .word   0 : 40
stack_end:
unsorted_array: .float 0.0:20
total:		.float 0.0
number: 	.float 5.0

space:		.asciiz " "
prompt: .asciiz "Enter the number of floats to enter :"
average: .asciiz "The average is: "
.text
main:
	la $t0, unsorted_array
	la $a0, prompt
	li $v0, 4
	syscall	#print the prompt out to the user
	li $v0, 5
	syscall	#get the input for the number of floats to enter
	move $t1, $v0
	#following two lines validate user input to be between 2 and 20
	bgt $t1, 20, main
	blt $t1, 2, main
	move $s0, $t1 #stores tha number for later user
	#the next two lines store and conver the number entered to be used in division for the average
	mtc1 $t1, $f8 
	cvt.s.w $f5, $f8
Loop:
	li $v0,6
	syscall # get float from user
	swc1 $f0, 0($t0) #store the number entered as a float
	addiu $t0, $t0, 4 #increment where we are storing things
	addiu $t1, $t1, -1 #decrement our loop
	add.s $f10, $f10, $f0 #add to the total to be used for average
	bnez $t1, Loop #loop until we get all the numbers that we need
######################################
Average:
	la $a0, average
	li $v0, 4
	syscall
	div.s $f12, $f10, $f5 # calculate the average
	li $v0, 2
	syscall
	addi $a0,$0,0xA		#print a new line
	li $v0, 11
	syscall
#######################################
	subi $t7, $s0, 1 # need our loop to run one less time than the number of numbers entered
	move $t6, $t7 #move the number into $t6 so we can reset the loop when we decrement it
Bubble_Sort:
	la $t2, unsorted_array
for_loop:
	l.s $f8, 0($t2)
	l.s $f9, 4($t2)
	c.lt.s $f9, $f8 # if the second value is less than first one, then we know the first value is larger
	bc1t swap
	bc1f noswap
swap:
	swc1 $f9, 0($t2) # put the smaller value in the first position
	swc1 $f8, 4($t2) #put the larger value in the second position
noswap:
	addiu $t7, $t7, -1 #decrement the for loop counter
	addiu $t2, $t2, 4  #increment the address for the next comparison
	bnez $t7, for_loop # continue through the for loop
	subi $t6, $t6, 1 #length needs to be one less long since highest calue is at the end, no need to compare with it
	beqz $t6, Print
	move $t7, $t6	 # put the adjusted lenght into the counter for our for loop
	bc1t Bubble_Sort #branch until we no longer swap
######################################################################
#print sorted array
#######################################################################
Print:
	la $t2, unsorted_array
PrintLoop:
	l.s $f12, 0($t2)
	li $v0, 2
	syscall
	addiu $s0, $s0, -1
	addiu $t2, $t2, 4
	la $a0, space
	li $v0, 4
	syscall
	bnez $s0, PrintLoop
#######################################################################
#exit the program
#######################################################################
Exit:	li $v0, 10
	syscall

