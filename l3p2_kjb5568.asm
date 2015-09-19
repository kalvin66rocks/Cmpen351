.data

firstnumber:	.asciiz " Done "

.text
addi $t1, $t1, 11      # j
addi $t2, $t2, 0     # k
addi $t3, $t3, 2        # 2

L1:     beqz $t1,  L2   
        div $t1, $t3        # i mod 2
        mfhi $t6           # temp for the mod
        mflo $t1
        jal printdigit
Lmod:   j L1               # repeat the while loop
        
printdigit:
        li $v0, 1       # system call code to print integer
        move $a0, $t6       # move integer to be printed into $a0
        syscall
        jr $ra


L2:     li $v0, 10     # close the program
        syscall
