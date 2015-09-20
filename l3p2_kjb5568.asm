.data
storage: .word
prompt: .asciiz "Please enter a number "
result: .space 8 #space for 8 digit hex to be stored

.text

la $a0,prompt    #loads prompt into $a0
li $v0,4   #sets up syscall to print the string
syscall     #syscall

li $v0,5   #sets up syscall to read in int
syscall     #syscall

la $t0,storage  #sets the address of $t0 to the addess of storage
sw $s0,($t0)    #sets the address fo $t0 (storage) to $t9

move $s0, $v0    #moves read in number to $s0 which is our data storage

move $t1,$s0	    #moves what the user inputed to $t1 for computation
addi $t2, $t2, 0     # counter for emptying stack
addi $t3, $t3, 2     # 2 for modulo division/ dividing by 2
addi $t4,$t4, 0	     # printout register
addi $t7,$t7, 0	     # holds a zero to pad with zeroes


#begin section to print out in binary
L1:     
	beqz $t1,  fill   #if dividee wouldbe 0 branch
        div $t1, $t3        # i mod 2
        mfhi $t6           #store the modulo in $t6
        mflo $t1	 #store the result of division in $t1
        jal binstore	#jump and link to store
Loop:   j L1               # repeat the while loop

binstore:	
	addi $sp, $sp, -4  #moves stack pointer
	sw $t6, 0($sp)   #loads $t6 into stack
	add $t2,$t2,1	#increments the counter
	jr $ra                   
printdigit:
	lw $t4,0($sp)  #loads value from stack 
	addi $sp, $sp, 4  #moves stack pointer
        li $v0, 1       # system call code to print integer
        move $a0, $t4       # move integer to be printed into $a0
        add $t2,$t2,-1	#subtracts one from the loop counter
        syscall
        jr $ra
fill:
	beq $t2,32, print
	addi $sp, $sp, -4  #moves stack pointer
	sw $t7, 0($sp)   #loads $t6 into stack
	add $t2,$t2,1	#increments the counter
	j fill
print:    
	beqz $t2,part2	#branches if loopcounter is 0
	jal printdigit  #jal to print digit
	j print
	
#at this point registers #$t1,t2,$t3, and $t4 can all be reused as the values contained do not matter anymore

#begin section to print out as hex
part2: 
	li $t0, 8           # counter     
	la $t3, result      # where answer will be stored
	move $t2,$s0
	
	la $a0, 0xa	     #creates a newline for the hex answer to be printed on
	li $v0, 11
	syscall
hex:
	beqz $t0, done      # branch to exit if counter is equal to zero     
	rol $t2, $t2, 4     # rotate 4 bits to the left     
	and $t4, $t2, 0xf           # mask with 1111     
	ble $t4, 9, Sum     # if less than or equal to nine, branch to sum     
	addi $t4, $t4, 55           # if greater than nine, add 55
	b hexstore

Sum:
	addi $t4,$t4, 48 #add 48 to the result

hexstore:
	sb $t4,0($t3)  #stores the hex digit
	addi $t3,$t3, 1 #increment address counter
	addi $t0,$t0,-1 #decrement the loop counter
	j hex


done:	
	la $a0,result
	li $v0, 4	#prints the string that our hex result is stored in
	syscall
	
	li $v0, 10     # close the program
        syscall
