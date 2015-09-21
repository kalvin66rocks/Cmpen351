.data

buffer: .word

firstnumber:	.asciiz "Please enter the first number to be multiplied "
secondnumber:	.asciiz "Please enter the second number to be multiplied "
fout: 		.asciiz "output"


.text

li $v0,4
la $a0,firstnumber
syscall

li $v0,5
syscall
move $s0,$v0
#first number to be multiplied is in $s0

li $v0,4
la $a0,secondnumber
syscall

li $v0,5
syscall
move $s1,$v0
#second number to be multiplied is in $s1



jal scarymult
j   output

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

output:

la $t5, buffer
sw $s3, 0($t5)

  li   $v0, 13       # system call for open file
  la   $a0, fout     # output file name
  li   $a1, 1        # Open for writing (flags are 0: read, 1: write)
  li   $a2, 0        # mode is ignored
  syscall            # open a file (file descriptor returned in $v0)
  move $s6, $v0      # save the file descriptor 

  li   $v0, 15       # system call for write to file
  move $a0, $s6      # file descriptor 
  la   $a1, buffer   # address of buffer from which to write
  li   $a2, 4       # hardcoded buffer length
  syscall            # write to file

  li   $v0, 16       # system call for close file
  move $a0, $s6      # file descriptor to close
  syscall            # close file
  
  li $v0,1
  move $a0,$s3
  syscall
  
  li $v0, 10     # close the program
  syscall


		
	
