.text

li $t0, 2147483647  #load the largest 32 bit number into memory
li $t1, 2147483647  #load the largest 32 bit number into memory

add $t2, $t1,$t0  #add the two largest 32 bit numbers to easily create arithmetic overflow
