.text

li $t0, 0
li $t0, 10
li $t2, 4   #register for the counter

loop:   add $t1,$t1,$t0    #starts the loop
	add $t1,$t1,10     #increments $t1
	sub $t2, $t2,1     #decreases the counter to progress the loop
	bgtz $t2, loop     #statement to repeat the loop or not