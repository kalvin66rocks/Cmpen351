.data
prompt: .asciiz "Please enter a string"

.text

la $a0,prompt    #loads prompt into $a0
li $v0,4   #sets up syscall to print the string
syscall     #syscall

li $v0,5   #sets up syscall to read in int
# string is in $v0
syscall     #syscall

addi $t0,$v0,0   #loads what is stored in $v0 to $t0
sll $t1,$t0,2    #multiplies $t0 by 4 and places it into $t1
add $t0,$t0,$t1  #adds $t0 and $t1 together which is original $t0 multiplied by 5

move $a0,$t0
li $v0, 1
syscall
 





