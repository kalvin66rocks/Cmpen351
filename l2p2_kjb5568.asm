.data
storage: .word
prompt: .asciiz "Please enter a number "

.text

la $a0,prompt    #loads prompt into $a0
li $v0,4   #sets up syscall to print the string
syscall     #syscall

li $v0,5   #sets up syscall to read in int
syscall     #syscall

la $t0,storage  #sets the address of $t0 to the addess of storage
sw $v0,($t0)    #sets the address fo $t0 (storage) to $v0

move $a0, $v0
li $v0, 35      #prints out the number in binary in 32 bits, left-padding with zeroes if necessary
syscall



