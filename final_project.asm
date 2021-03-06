.data

stack_beg:
        .word   0 : 60
stack_end:

ColorTable:
.word 0x000000	#black
.word 0x0000ff	#blue 
.word 0x00ff00	#green
.word 0xff0000	#red
.word 0x00ffff	#blue + green (cyan)
.word 0xffff00	#blue + red   (magenta) 
.word 0xffff00	#green +red   (yellow)
.word 0xffffff	#white

Colors: 
	
	
	.word   0x000000        # foreground color (black)
	.word   0xffffff        # background color (white)
        

DigitTable:   #original font written by Robin Panda.
        .byte   ' ', 0,0,0,0,0,0,0,0,0,0,0,0
        .byte   '0', 0x7e,0xff,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '1', 0x38,0x78,0xf8,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte   '2', 0x7e,0xff,0x83,0x06,0x0c,0x18,0x30,0x60,0xc0,0xc1,0xff,0x7e
        .byte   '3', 0x7e,0xff,0x83,0x03,0x03,0x1e,0x1e,0x03,0x03,0x83,0xff,0x7e
        .byte   '4', 0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   '5', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0x7f,0x03,0x03,0x83,0xff,0x7f
        .byte   '6', 0xc0,0xc0,0xc0,0xc0,0xc0,0xfe,0xfe,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '7', 0x7e,0xff,0x03,0x06,0x06,0x0c,0x0c,0x18,0x18,0x30,0x30,0x60
        .byte   '8', 0x7e,0xff,0xc3,0xc3,0xc3,0x7e,0x7e,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '9', 0x7e,0xff,0xc3,0xc3,0xc3,0x7f,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   '+', 0x00,0x00,0x00,0x18,0x18,0x7e,0x7e,0x18,0x18,0x00,0x00,0x00
        .byte   '-', 0x00,0x00,0x00,0x00,0x00,0x7e,0x7e,0x00,0x00,0x00,0x00,0x00
        .byte   '*', 0x00,0x00,0x00,0x66,0x3c,0x18,0x18,0x3c,0x66,0x00,0x00,0x00
        .byte   '/', 0x00,0x00,0x18,0x18,0x00,0x7e,0x7e,0x00,0x18,0x18,0x00,0x00
        .byte   '=', 0x00,0x00,0x00,0x00,0x7e,0x00,0x7e,0x00,0x00,0x00,0x00,0x00
        .byte   'A', 0x18,0x3c,0x66,0xc3,0xc3,0xc3,0xff,0xff,0xc3,0xc3,0xc3,0xc3
        .byte   'B', 0xfc,0xfe,0xc3,0xc3,0xc3,0xfe,0xfe,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'C', 0x7e,0xff,0xc1,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc1,0xff,0x7e
        .byte   'D', 0xfc,0xfe,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'E', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xff,0xff
        .byte   'F', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xc0,0xc0
       #extended font written by michael stumpf, thank you
        .byte   'G', 0x3f,0x7f,0xc1,0xc0,0xc0,0xc0,0xcf,0xcf,0xc1,0xc1,0x7f,0x3f  # might have to fix this 
        .byte   'H', 0xc3,0xc3,0xc3,0xc3,0xff,0xff,0xff,0xc3,0xc3,0xc3,0xc3,0xc3
        .byte   'I', 0xff,0xff,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0xff,0xff
        .byte   'J', 0xff,0xff,0x18,0x18,0x18,0x18,0x18,0xd8,0xd8,0xd8,0xf8,0x70
        .byte   'K', 0xc3,0xc7,0xcc,0xdc,0xd8,0xf0,0xf0,0xd8,0xc6,0xc6,0xc6,0xc3
        .byte   'L', 0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xff,0xff
        .byte   'M', 0xc3,0xc3,0xc3,0xe7,0xbd,0x99,0x81,0x81,0x81,0x81,0x81,0x81
        .byte   'N', 0x8f,0xc3,0xe3,0xe3,0xf3,0xdb,0xcf,0xc7,0xc3,0xc3,0xc3,0xc3
        .byte   'O', 0x3c,0x7e,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0x7e,0x3c
        .byte   'P', 0xfc,0xc4,0xc2,0xc2,0xc2,0xfc,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0
        .byte   'Q', 0x3c,0x7e,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0x3c,0x08,0x06
        .byte   'R', 0xfc,0xc4,0xc2,0xc2,0xc2,0xfc,0xcc,0xce,0xc7,0xc3,0xc3,0xc3
        .byte   'S', 0x3c,0xfe,0x80,0x80,0xf8,0x7c,0x02,0x03,0x03,0x03,0x7e,0x7c
        .byte   'T', 0xff,0xff,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte   'U', 0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0x42,0x66,0x18
        .byte   'V', 0x81,0x81,0x81,0x81,0x81,0x81,0x42,0x42,0x24,0x24,0x18,0x18
        .byte   'W', 0x81,0x81,0x81,0x81,0x81,0x99,0x99,0x5a,0x5a,0x66,0x66,0x66
        .byte   'X', 0xe7,0xe7,0x42,0x42,0x66,0x18,0x18,0x24,0x66,0x42,0xe7,0xe7
        .byte   'Y', 0xc3,0xc3,0x42,0x42,0x66,0x18,0x18,0x18,0x18,0x18,0x3c,0x3c
        .byte   'Z', 0xff,0xff,0x03,0x06,0x06,0x0c,0x18,0x30,0x60,0xc0,0xff,0xff
        
# add additional characters here....
# first byte is the ascii character
# next 12 bytes are the pixels that are "on" for each of the 12 lines
        .byte    0, 0,0,0,0,0,0,0,0,0,0,0,0

triangle_text: .asciiz "SIERPINSKI TRIANGLE"
triangle_text1: .asciiz "A SIERPINSKI TRIANGLE IS MADE BY DRAWING A "
triangle_text2: .asciiz "TRIANGLE THEN DRAWING THREE TRIANGLES AROUND"
triangle_text3: .asciiz "IT THAT ARE 1/3 OF THE SIZE REPEATING THIS "
triangle_text4: .asciiz "UNTIL THE SUB TRIANGLES ARE TOO SMALL TO SEE "
triangle_text5: .asciiz "PRESS ANY KEY TO CONTINUE "
koch_text: .asciiz "KOCH CURVE"
koch_text1: .asciiz "THE BASE CASE OF THE KOCH CURVE IS"
koch_text2: .asciiz "A STRAIGHT LINE"
koch_text3: .asciiz "PRESS ANY KEY TO CONTINUE"                 
koch_text4: .asciiz "THE FIRST ITERATION OF THE CURVE IS FORMED BY"
koch_text5: .asciiz "TRAVELING 1/3 OF A LENGTH THEN MAKING A 60 "
koch_text6: .asciiz "DEGREE LEFT TURN TRAVELING 1/3 OF A LENGTH "
koch_text7: .asciiz "THEN MAKING A 120 DEGREE RIGHT TURN TAVELING"
koch_text8: .asciiz "1/3 OF A LENGTH THEN MAKING A 60 DEGREE LEFT"
koch_text9: .asciiz "TURN THEN TRAVELING 1/3 OF A LENGTH"
koch_text10: .asciiz "IN EACH FOLLOWING ITERATION THIS PATTERN IS"
koch_text11: .asciiz "APPLIED TO EACH STRAIGHT EDGE FROM THE"
koch_text12: .asciiz "PREVIOUS ITERATION"
dust_text: .asciiz "CANTOR DUST"
dust_text1: .asciiz "CANTOR DUST  IS A "
dust_text2: .asciiz "FRACTAL THAT IS "
dust_text3: .asciiz "MADE BY DRAWING "
dust_text4: .asciiz "  SQUARE THEN "
dust_text5: .asciiz "DRAWING 4 SMALLER "
dust_text6: .asciiz "SQUARES EACH 1/4 OF"
dust_text7: .asciiz "THE SIZE OF THE"
dust_text8: .asciiz "ORIGINAL IN THE 4 "
dust_text9: .asciiz "CORNERS THIS"
dust_text10: .asciiz "REPEATS INFINITELY "
dust_text11: .asciiz "MAKING IT APPEAR"
dust_text12: .asciiz "AS THOUGH IT WERE"
dust_text13: .asciiz "TURNING TO DUST"
dust_text14: .asciiz "PRESS ANY KEY"
dust_text15: .asciiz "TO CONTINUE"
main_text_line_1: .asciiz " WELCOME TO MY FRACTAL VIEWER"
main_text_line_2: .asciiz "PLEASE HIT THE NUMBER CORRESPONDING TO"    
main_text_line_3: .asciiz "THE FRACTAL THAT YOU WOULD LIKE TO SEE"
choice_1: .asciiz "1    SIERPINSKI TRIANGLE"	
choice_2: .asciiz "2    CANTOR DUST"
choice_3: .asciiz "3    KOCH CURVE"
choice_4: .asciiz "4    EXIT"


.text

###############################################################################################
#main menu
#determines what procedure to jump to based off of user input
main_menu:
	
	li      $a0, 125
        li      $a1, 45
        la      $a2, main_text_line_1
        jal     OutText
        
        li      $a0, 45
        li      $a1, 65
        la      $a2, main_text_line_2
        jal     OutText
        
        li      $a0, 45
        li      $a1, 85
        la      $a2, main_text_line_3
        jal     OutText
        
        li      $a0, 105
        li      $a1, 165
        la      $a2, choice_1
        jal     OutText
        
        #draws a triangle
        li $a0, 375
	li $a1, 180
	li $a2, 1
	li $a3, 32
	jal drawtriangle
        
        li      $a0, 105
        li      $a1, 245
        la      $a2, choice_2
        jal     OutText
        
        #draws a square
        li $a0, 275
	li $a1, 265
	li $a2, 3
	li $a3, 32
	jal DrawBox
        
        li      $a0, 105
        li      $a1, 325
        la      $a2, choice_3
        jal     OutText
        
        #draws a piece of the curve
        #draws a straight line 5 pixels thick
	li $a0, 256
	li $a1, 350
	li $a2, 4
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
	li $a0, 256
	li $a1, 350
	li $a3, 64
	jal HorzLine
        
        li      $a0, 105
        li      $a1, 405
        la      $a2, choice_4
        jal     OutText
        
choices:
	li $v0,12
	syscall
	sub $a0,$v0,48 #corrects the character to integer by subtracting 48
	
	la $ra, main_menu
	beq $a0,1, drawsierpenski
	beq $a0,2, drawdust
	beq $a0,3, drawkoch
	beq $a0,4, exit_program
	j main_menu
	
		

exit_program:			#exits the program
	li      $v0, 10
        syscall


###############################################################################################
#draw sierpenski triangle
# has no arguements as everything is calculated inside of the procedures located within
drawsierpenski:
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	#main triangle
	li $a0, 256
	li $a1, 180
	li $a2, 1
	li $a3, 128
	jal drawtriangle
	
	#three triangles the middle
	#right
	li $a0, 384
	li $a1, 180
	li $a3, 64
	jal drawtriangle
	#left
	li $a0, 128
	li $a1, 180
	li $a3, 64
	jal drawtriangle
	#bottom
	li $a0, 256
	li $a1, 308
	li $a3, 64
	jal drawtriangle
	
	#triangles around the right
	#right
	li $a0, 448
	li $a1, 180
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 480
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 416
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 448
	li $a1, 212
	li $a3, 16
	jal drawtriangle
	
	#left
	li $a0, 320
	li $a1, 180
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 352
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 288
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 320
	li $a1, 212
	li $a3, 16
	jal drawtriangle
	
	#bottom
	li $a0, 384
	li $a1, 244
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 416
	li $a1, 244
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 352
	li $a1, 244
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 384
	li $a1, 276
	li $a3, 16
	jal drawtriangle
	
	#triangles around the left
	#right
	li $a0, 192
	li $a1, 180
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 224
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 160
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 192
	li $a1, 212
	li $a3, 16
	jal drawtriangle
	
	#left
	li $a0, 64
	li $a1, 180
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#left
	li $a0, 32
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#right
	li $a0, 96
	li $a1, 180
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 64
	li $a1, 212
	li $a3, 16
	jal drawtriangle
	
	#bottom
	li $a0, 128
	li $a1, 244
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 160
	li $a1, 244
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 96
	li $a1, 244
	li $a2, 1
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 128
	li $a1, 276
	li $a3, 16
	jal drawtriangle
	
	
	#triangles around the bottom
	#right
	li $a0, 320
	li $a1, 308
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 352
	li $a1, 308
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 288
	li $a1, 308
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 320
	li $a1, 340
	li $a3, 16
	jal drawtriangle
	
	#left
	li $a0, 192
	li $a1, 308
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 224
	li $a1, 308
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 160
	li $a1, 308
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 192
	li $a1, 340
	li $a3, 16
	jal drawtriangle

	#bottom
	li $a0, 256
	li $a1, 372
	li $a3, 32
	jal drawtriangle
	#smaller triangles
	#right
	li $a0, 288
	li $a1, 372
	li $a3, 16
	jal drawtriangle
	#left
	li $a0, 224
	li $a1, 372
	li $a3, 16
	jal drawtriangle
	#bottom
	li $a0, 256
	li $a1, 404
	li $a3, 16
	jal drawtriangle
	
	#display text on bitmap display
	li      $a0, 165
        li      $a1, 10
        la      $a2, triangle_text
        jal     OutText
        
        li      $a0, 45
        li      $a1, 45
        la      $a2, triangle_text1
        jal     OutText
        
        li      $a0, 45
        li      $a1, 65
        la      $a2, triangle_text2
        jal     OutText
        
        li      $a0, 45
        li      $a1, 85
        la      $a2, triangle_text3
        jal     OutText
        
        li      $a0, 45
        li      $a1, 105
        la      $a2, triangle_text4
        jal     OutText
	
	li      $a0, 165
        li      $a1, 125
        la      $a2, triangle_text5
        jal     OutText
        
        li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	lw $ra,4($sp)
	addiu $sp,$sp, 4
	jr $ra


###############################################################################################
#draw cantor dust
# has no arguements as everything is calculated inside of the procedures located within
#outputs to the bitmap display
drawdust:
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	
	#draws the first box (largest)
	li $a0, 192
	li $a1, 50
	li $a2, 3
	li $a3, 128
	jal DrawBox
	
	#second largest boxes
	#top left
	li $a0, 192
	li $a1, 190
	li $a3, 32
	jal DrawBox
	#top right
	li $a0, 288
	li $a1, 190
	li $a3, 32
	jal DrawBox
	#bottom left
	li $a0, 192
	li $a1, 286
	li $a3, 32
	jal DrawBox
	#bottom right
	li $a0, 288
	li $a1, 286
	li $a3, 32
	jal DrawBox
	
	#4 in top left
	#top left
	li $a0, 192
	li $a1, 330
	li $a3, 8
	jal DrawBox
	#top right
	li $a0, 216
	li $a1, 330
	li $a3, 8
	jal DrawBox
	#bottom left
	li $a0, 192
	li $a1, 354
	li $a3, 8
	jal DrawBox
	#bottom right
	li $a0, 216
	li $a1, 354
	li $a3, 8
	jal DrawBox	
	
	
	#4 in top right
	#top left
	li $a0, 288
	li $a1, 330
	li $a3, 8
	jal DrawBox
	#top right
	li $a0, 312
	li $a1, 330
	li $a3, 8
	jal DrawBox
	#bottom left
	li $a0, 288
	li $a1, 354
	li $a3, 8
	jal DrawBox
	#bottom right
	li $a0, 312
	li $a1, 354
	li $a3, 8
	jal DrawBox
	
	#4 in bottom left
	#top left
	li $a0, 192
	li $a1, 450
	li $a3, 8
	jal DrawBox
	#top right
	li $a0, 216
	li $a1, 450
	li $a3, 8
	jal DrawBox
	#bottom left
	li $a0, 192
	li $a1, 474
	li $a3, 8
	jal DrawBox
	#bottom right
	li $a0, 216
	li $a1, 474
	li $a3, 8
	jal DrawBox
	
	
	#4 in bottom right
	#top left
	li $a0, 288
	li $a1, 450
	li $a3, 8
	jal DrawBox
	#top right
	li $a0, 312
	li $a1, 450
	li $a3, 8
	jal DrawBox
	#bottom left
	li $a0, 288
	li $a1, 474
	li $a3, 8
	jal DrawBox
	#bottom right
	li $a0, 312
	li $a1, 474
	li $a3, 8
	jal DrawBox
	
	
	
	li      $a0, 165
        li      $a1, 10
        la      $a2, dust_text
        jal     OutText
        
        li      $a0, 10
        li      $a1, 50
        la      $a2, dust_text1
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text2
        jal     OutText
	
	addiu 	$a1,$a1, 30
        la      $a2, dust_text3
        jal     OutText
	
	addiu 	$a1,$a1, 30
        la      $a2, dust_text4
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text5
        jal     OutText
	
	addiu 	$a1,$a1, 30
        la      $a2, dust_text6
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text7
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text8
        jal     OutText
	
	addiu 	$a1,$a1, 30
        la      $a2, dust_text9
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text10
        jal     OutText
        
        li      $a0, 330
        li      $a1, 50
        la      $a2, dust_text11
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text12
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text13
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text14
        jal     OutText
        
        addiu 	$a1,$a1, 30
        la      $a2, dust_text15
        jal     OutText
        
	li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	la $ra, main_menu
	jr $ra

###############################################################################################
#draw koch curve
#has no arguements as everything is calculated inside of the procedures located within
#outputs to the bitmap display
drawkoch:
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	#base case
	#draws a straight line 7 pixels thick
	li $a0, 0
	li $a1, 253
	li $a2, 4
	li $a3, 512
	jal HorzLine
	
	li $a3, 512
	jal HorzLine
	li $a3, 512
	jal HorzLine
	li $a3, 512
	jal HorzLine
	li $a3, 512
	jal HorzLine
	li $a3, 512
	jal HorzLine
	li $a3, 512
	jal HorzLine
	
	li      $a0, 165
        li      $a1, 10
        la      $a2, koch_text
        jal     OutText
        
        li      $a0, 45
        li      $a1, 285
        la      $a2, koch_text1
        jal     OutText
        
        li      $a0, 45
        li      $a1, 305
        la      $a2, koch_text2
        jal     OutText
	
	li      $a0, 45
        li      $a1, 325
        la      $a2, koch_text3
        jal     OutText
	
	li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	#first iteration will have one 60 degree turn (about 60 because mips display)
	
	li $a0, 0
	li $a1, 253
	li $a2, 4
	li $a3, 175
	jal HorzLine
	
	li $a0, 0
	li $a3, 175
	li $a1, 254
	jal HorzLine
	li $a0, 0
	li $a1, 255
	li $a3, 175
	jal HorzLine
	li $a0, 0
	li $a1, 255
	li $a3, 175
	jal HorzLine
	li $a0, 0
	li $a1, 256
	li $a3, 175
	jal HorzLine
	li $a0, 0
	li $a1, 257
	li $a3, 175
	jal HorzLine
	li $a0, 0
	li $a1, 258
	li $a3, 175
	jal HorzLine
	
	#draws the peak in the middle
	li $a0, 254
	li $a1, 90
	li $a2, 4
	li $a3, 7
	jal DrawBox
	#left
	
	li $a0, 252   
	li $a1, 92
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 250   
	li $a1, 96
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 248   
	li $a1, 100
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 246   
	li $a1, 104
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 244   
	li $a1, 108
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 242   
	li $a1, 112
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 240   
	li $a1, 116
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 238   
	li $a1, 120
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 236   
	li $a1, 124
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 234   
	li $a1, 128
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 232 ########old 1/4 mark  
	li $a1, 132
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 230 
	li $a1, 136
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 228 
	li $a1, 140
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 226 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 224 
	li $a1, 148
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 222
	li $a1, 152
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 220 
	li $a1, 156
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 218 
	li $a1, 160
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 216 
	li $a1, 164
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 214 
	li $a1, 168
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 212 
	li $a1, 172
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 210 #old 1/2 way
	li $a1, 176 #will be useful for next iteration, everything above this and 1/4 will be deleted
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 208
	li $a1, 180
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 206
	li $a1, 184
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 204
	li $a1, 188
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 202
	li $a1, 192
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 200
	li $a1, 196
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 198
	li $a1, 200
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 196
	li $a1, 204
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 194
	li $a1, 208
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 192
	li $a1, 212
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 190 #old 3/4 way down
	li $a1, 216
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 188
	li $a1, 220
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 186
	li $a1, 224
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 184
	li $a1, 228
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 182
	li $a1, 232
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 180
	li $a1, 236
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 178
	li $a1, 240
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 176
	li $a1, 244
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 174
	li $a1, 248
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 172
	li $a1, 252
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	#right
	li $a0, 256   
	li $a1, 92
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 258   
	li $a1, 96
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 260  
	li $a1, 100
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 262   
	li $a1, 104
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 264   
	li $a1, 108
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 266   
	li $a1, 112
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 268   
	li $a1, 116
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 270   
	li $a1, 120
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 272   
	li $a1, 124
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 274   
	li $a1, 128
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 276 ########old 1/4 mark  
	li $a1, 132
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 278 
	li $a1, 136
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 280 
	li $a1, 140
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 282 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 284 
	li $a1, 148
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 286
	li $a1, 152
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 288 
	li $a1, 156
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 290 
	li $a1, 160
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 292 
	li $a1, 164
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 294 
	li $a1, 168
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 296 
	li $a1, 172
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 298 #old 1/2 way
	li $a1, 176 #will be useful for next iteration, everything above this and 1/4 will be deleted
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 300
	li $a1, 180
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 302
	li $a1, 184
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 304
	li $a1, 188
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 306
	li $a1, 192
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 308
	li $a1, 196
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 310
	li $a1, 200
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 312
	li $a1, 204
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 314
	li $a1, 208
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 316
	li $a1, 212
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 318 #old 3/4 way down
	li $a1, 216
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 320
	li $a1, 220
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 322
	li $a1, 224
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 324
	li $a1, 228
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 326
	li $a1, 232
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 328
	li $a1, 236
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 330
	li $a1, 240
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 332
	li $a1, 244
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 334
	li $a1, 248
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 336
	li $a1, 252
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	
	#second straight line
	li $a0, 340
	li $a1, 253
	li $a2, 4
	li $a3, 170
	jal HorzLine
	
	li $a0, 340
	li $a3, 170
	li $a1, 254
	jal HorzLine
	li $a0, 340
	li $a1, 255
	li $a3, 170
	jal HorzLine
	li $a0, 340
	li $a1, 255
	li $a3, 170
	jal HorzLine
	li $a0, 340
	li $a1, 256
	li $a3, 170
	jal HorzLine
	li $a0, 340
	li $a1, 257
	li $a3, 170
	jal HorzLine
	li $a0, 340
	li $a1, 258
	li $a3, 170
	jal HorzLine
	
	li      $a0, 165
        li      $a1, 10
        la      $a2, koch_text
        jal     OutText
        
        li      $a0, 45
        li      $a1, 285
        la      $a2, koch_text4
        jal     OutText
        
        li      $a0, 45
        li      $a1, 305
        la      $a2, koch_text5
        jal     OutText
	
	li      $a0, 45
        li      $a1, 325
        la      $a2, koch_text6
        jal     OutText
	
	li      $a0, 45
        li      $a1, 345
        la      $a2, koch_text7
        jal     OutText
	
	li      $a0, 45
        li      $a1, 365
        la      $a2, koch_text8
        jal     OutText
	
	li      $a0, 45
        li      $a1, 385
        la      $a2, koch_text9
        jal     OutText
	
	li      $a0, 45
        li      $a1, 405
        la      $a2, koch_text3
        jal     OutText
	
	li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	#second iteration
	#this iteration will have 4 additional 60 degree turns in it
	
	li $a0, 0
	li $a1, 253
	li $a2, 4
	li $a3, 55
	jal HorzLine
	
	li $a0, 0
	li $a3, 55
	li $a1, 254
	jal HorzLine
	li $a0, 0
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 0
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 0
	li $a1, 256
	li $a3, 55
	jal HorzLine
	li $a0, 0
	li $a1, 257
	li $a3, 55
	jal HorzLine
	li $a0, 0
	li $a1, 258
	li $a3, 55
	jal HorzLine
	
	#left peak goes here
	li $a0, 53
	li $a1, 249
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 55
	li $a1, 245
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 57
	li $a1, 241
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 59
	li $a1, 237
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 61
	li $a1, 233
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 63
	li $a1, 229
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 65
	li $a1, 225
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 67
	li $a1, 221
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 69
	li $a1, 217
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 71
	li $a1, 213
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 73
	li $a1, 209
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 75
	li $a1, 205
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 77
	li $a1, 201
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 79
	li $a1, 197
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 81
	li $a1, 193
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 83
	li $a1, 189
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 84
	li $a1, 187
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 85
	li $a1, 189
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 87
	li $a1, 193
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 89
	li $a1, 197
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 91
	li $a1, 201
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 93
	li $a1, 205
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 95
	li $a1, 209
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 97
	li $a1, 213
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 99
	li $a1, 217
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 101
	li $a1, 221
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 103
	li $a1, 225
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 105
	li $a1, 229
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 107
	li $a1, 233
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 109
	li $a1, 237
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 111
	li $a1, 241
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 113
	li $a1, 245
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 115
	li $a1, 249
	li $a2, 4
	li $a3, 7
	jal DrawBox  #end of left peak
	
	li $a0, 115
	li $a1, 253
	li $a2, 4
	li $a3, 60
	jal HorzLine
	
	li $a0, 115
	li $a3, 60
	li $a1, 254
	jal HorzLine
	li $a0, 115
	li $a1, 255
	li $a3, 60
	jal HorzLine
	li $a0, 115
	li $a1, 255
	li $a3, 60
	jal HorzLine
	li $a0, 115
	li $a1, 256
	li $a3, 60
	jal HorzLine
	li $a0, 115
	li $a1, 257
	li $a3, 60
	jal HorzLine
	li $a0, 115
	li $a1, 258
	li $a3, 60
	jal HorzLine
	
	#draws the peak in the middle
	li $a0, 254
	li $a1, 90
	li $a2, 4
	li $a3, 7
	jal DrawBox
	#left
	
	li $a0, 252   
	li $a1, 92
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 250   
	li $a1, 96
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 248   
	li $a1, 100
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 246   
	li $a1, 104
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 244   
	li $a1, 108
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 242   
	li $a1, 112
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 240   
	li $a1, 116
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 238   
	li $a1, 120
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 236   
	li $a1, 124
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 234   
	li $a1, 128
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 232 ########old 1/4 mark  
	li $a1, 132
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 230 
	li $a1, 136
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 228 
	li $a1, 140
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 226 #begin horizontal line
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 220 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 214 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 217 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 210 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 205 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 200 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 193 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 187 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 180 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 175 
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 170 #end horizontal line
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 172 
	li $a1, 148
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 174 
	li $a1, 152
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 176 
	li $a1, 156
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 178 
	li $a1, 160
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 180
	li $a1, 164
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 182
	li $a1, 168
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 184
	li $a1, 172
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 186
	li $a1, 176
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 188
	li $a1, 180
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 190
	li $a1, 184
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 192
	li $a1, 188
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 194
	li $a1, 192
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 196
	li $a1, 196
	li $a2, 4
	li $a3, 7
	jal DrawBox
					
	li $a0, 198 ######might be more useful for iteration 2
	li $a1, 200
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 196
	li $a1, 204
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 194
	li $a1, 208
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 192
	li $a1, 212
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 190 #old 3/4 way down
	li $a1, 216
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 188
	li $a1, 220
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 186
	li $a1, 224
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 184
	li $a1, 228
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 182
	li $a1, 232
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 180
	li $a1, 236
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 178
	li $a1, 240
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 176
	li $a1, 244
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 174
	li $a1, 248
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 172
	li $a1, 252
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	#right
	li $a0, 256   
	li $a1, 92
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 258   
	li $a1, 96
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 260  
	li $a1, 100
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 262   
	li $a1, 104
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 264   
	li $a1, 108
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 266   
	li $a1, 112
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 268   
	li $a1, 116
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 270   
	li $a1, 120
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 272   
	li $a1, 124
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 274   
	li $a1, 128
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 276 ########old 1/4 mark  
	li $a1, 132
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 278 
	li $a1, 136
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 280 
	li $a1, 140
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 282 #begin horizontal
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 285
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 292
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 297
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 304
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 311
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 318
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 325
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 331
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 337
	li $a1, 144
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 336 
	li $a1, 148
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 334 
	li $a1, 152
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 332 
	li $a1, 156
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 330 
	li $a1, 160
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 328 
	li $a1, 164
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 326 
	li $a1, 168
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 324 
	li $a1, 172
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 322 
	li $a1, 176
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 320 
	li $a1, 180
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 318 
	li $a1, 184
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 316 
	li $a1, 188
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 314
	li $a1, 192
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 312 
	li $a1, 196
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 310 #might be more useful for iteration 2
	li $a1, 200
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 312
	li $a1, 204
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 314
	li $a1, 208
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 316
	li $a1, 212
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 318 #old 3/4 way down
	li $a1, 216
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 320
	li $a1, 220
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 322
	li $a1, 224
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 324
	li $a1, 228
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 326
	li $a1, 232
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 328
	li $a1, 236
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 330
	li $a1, 240
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 332
	li $a1, 244
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 334
	li $a1, 248
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 336
	li $a1, 252
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	
	#second straight line
	
	
	li $a0, 340
	li $a1, 253
	li $a2, 4
	li $a3, 55
	jal HorzLine
	
	li $a0, 340
	li $a3, 55
	li $a1, 254
	jal HorzLine
	li $a0, 340
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 340
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 340
	li $a1, 256
	li $a3, 55
	jal HorzLine
	li $a0, 340
	li $a1, 257
	li $a3, 55
	jal HorzLine
	li $a0, 340
	li $a1, 258
	li $a3, 55
	jal HorzLine
	
	#right peak
	li $a0, 391
	li $a1, 249
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 393
	li $a1, 245
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 395
	li $a1, 241
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 397
	li $a1, 237
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 399
	li $a1, 233
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 401
	li $a1, 229
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 403
	li $a1, 225
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 405
	li $a1, 221
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 407
	li $a1, 217
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 409
	li $a1, 213
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 411
	li $a1, 209
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 413
	li $a1, 205
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 415
	li $a1, 201
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 417
	li $a1, 197
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 419
	li $a1, 193
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 421
	li $a1, 189
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 423
	li $a1, 187
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 425
	li $a1, 189
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 427
	li $a1, 193
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 429
	li $a1, 197
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 431
	li $a1, 201
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 433
	li $a1, 205
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 435
	li $a1, 209
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 437
	li $a1, 213
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 439
	li $a1, 217
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 441
	li $a1, 221
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 443
	li $a1, 225
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 445
	li $a1, 229
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 447
	li $a1, 233
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 449
	li $a1, 237
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 451
	li $a1, 241
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 453
	li $a1, 245
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 455
	li $a1, 249
	li $a2, 4
	li $a3, 7
	jal DrawBox
	
	li $a0, 457
	li $a1, 251
	li $a2, 4
	li $a3, 7
	jal DrawBox #end second peak
	
	
	li $a0, 457
	li $a1, 253
	li $a2, 4
	li $a3, 55
	jal HorzLine
	li $a0, 457
	li $a3, 55
	li $a1, 254
	jal HorzLine
	li $a0, 457
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 457
	li $a1, 255
	li $a3, 55
	jal HorzLine
	li $a0, 457
	li $a1, 256
	li $a3, 55
	jal HorzLine
	li $a0, 457
	li $a1, 257
	li $a3, 55
	jal HorzLine
	li $a0, 457
	li $a1, 258
	li $a3, 55
	jal HorzLine
	
	li      $a0, 205
        li      $a1, 10
        la      $a2, koch_text
        jal     OutText
        
        li      $a0, 45
        li      $a1, 285
        la      $a2, koch_text10
        jal     OutText
        
        li      $a0, 45
        li      $a1, 305
        la      $a2, koch_text11
        jal     OutText
	
	li      $a0, 45
        li      $a1, 325
        la      $a2, koch_text12
        jal     OutText
	
	li      $a0, 45
        li      $a1, 345
        la      $a2, koch_text3
        jal     OutText
		
	li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
	
	j main_menu

#############################################################
#calc address
#a0 is x coordinate
#a1 is y cooridinate
#$v0 is the address in memory we want to draw our dot 
#############################################################
calcaddress:
	sll $t0, $a0, 2
	sll $t1, $a1, 11    #10 for 256, 11 for 512
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
#takes in location x $a0, and y $a1 and draws a dot of color $a2 there
#outputs to the bitmap display
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
#takes in a starting position of ($a0, $a1) (x,y) and draws a line of length $a2 and color $a3
#outputs to the bitmap display
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
#takes in a starting position of ($a0, $a1) (x,y) and draws a line of length $a2 and color $a3
#outputs to the bitmap display
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
#takes in a starting position of ($a0, $a1) (x,y) and draws a box of size $a2 and color $a3
#outputs to the bitmap display
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

	
###################################################################
#draw a diagonal line Down
#takes in a starting position of ($a0, $a1) (x,y) and draws a line of length $a2 and color $a3
#outputs to the bitmap display
################################################################
DiagLineDown:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
DiagLoopDown:
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
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, DiagLoopDown
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
################################################################
#draw a diagonal line Up
#takes in a starting position of ($a0, $a1) (x,y) and draws a line of length $a2 and color $a3
#outputs to the bitmap display
################################################################
DiagLineUp:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
DiagLoopUp:
	addiu $sp,$sp, -12
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	jal drawdot
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	addiu $sp,$sp, 12
	addiu $a0,$a0, -1
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bne   $a3,$0, DiagLoopUp
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra
	
		
	
##########################################################################################
# draw a triangle
#takes in a starting position of ($a0, $a1) (x,y) and draws a triangle with side lengths of $a2 and color $a3
#outputs to the bitmap display
##########################################################################################
drawtriangle:
	addiu $sp,$sp, -4
	sw $ra, 4($sp)
TriangleLoop:
	addiu $sp,$sp, -16
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	sw $a3, 16($sp)
	jal DiagLineUp
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	lw $a3, 16($sp)
	addiu $sp,$sp, 16
	addiu $sp,$sp, -16
	sw $a0, 12($sp)
	sw $a1, 8($sp)
	sw $a2, 4($sp)
	sw $a3, 16($sp)
	jal DiagLineDown
	lw $a0, 12($sp)
	lw $a1, 8($sp)
	lw $a2, 4($sp)
	lw $a3, 16($sp)
	addiu $sp,$sp, 16
	addiu $a1,$a1, 1
	addiu $a3,$a3, -1
	bnez   $a3,TriangleLoop 
	lw $ra, 4($sp)
	addiu $sp,$sp, 4
	jr $ra



########################################################################################################################################################
# OutText: display ascii characters on the bit mapped display
# Following code is written panda, thanks for the asciiz to display functions

# $a0 = horizontal pixel co-ordinate (0-256 number changes based off you display)
# $a1 = vertical pixel co-ordinate (0-256 number changes based off you display)
# $a2 = pointer to asciiz text (to be displayed)

OutText:
        addiu   $sp, $sp, -24
        sw      $ra, 20($sp)

        li      $t8, 1          # line number in the digit array (1-12)
_text1:
        la      $t9, 0x10040000 # get the memory start address
        sll     $t0, $a0, 2     # assumes mars was configured as 512 x 512 number will change based off your display 
        addu    $t9, $t9, $t0   # and 1 pixel width, 1 pixel height
        sll     $t0, $a1, 11    # (a0 * 4) + (a1 * 4 * 512) this is the only place you need to change anything if you are using a different display 
        addu    $t9, $t9, $t0   # t9 = memory address for this pixel

        move    $t2, $a2        # t2 = pointer to the text string
_text2:
        lb      $t0, 0($t2)     # character to be displayed
        addiu   $t2, $t2, 1     # last character is a null
        beq     $t0, $zero, _text9

        la      $t3, DigitTable # find the character in the table
_text3:
        lb      $t4, 0($t3)     # get an entry from the table
        beq     $t4, $t0, _text4
        beq     $t4, $zero, _text4
        addiu   $t3, $t3, 13    # go to the next entry in the table
        j       _text3
_text4:
        addu    $t3, $t3, $t8   # t8 is the line number
        lb      $t4, 0($t3)     # bit map to be displayed

        sw      $zero, 0($t9)   # first pixel is black
        addiu   $t9, $t9, 4

        li      $t5, 8          # 8 bits to go out
_text5:
        la      $t7, Colors
        lw      $t7, 0($t7)     # assume black
        andi    $t6, $t4, 0x80  # mask out the bit (0=black, 1=white)
        beq     $t6, $zero, _text6
        la      $t7, Colors     # else it is white
        lw      $t7, 4($t7)
_text6:
        sw      $t7, 0($t9)     # write the pixel color
        addiu   $t9, $t9, 4     # go to the next memory position
        sll     $t4, $t4, 1     # and line number
        addiu   $t5, $t5, -1    # and decrement down (8,7,...0)
        bne     $t5, $zero, _text5

        sw      $zero, 0($t9)   # last pixel is black
        addiu   $t9, $t9, 4
        j       _text2          # go get another character

_text9:
        addiu   $a1, $a1, 1     # advance to the next line
        addiu   $t8, $t8, 1     # increment the digit array offset (1-12)
        bne     $t8, 13, _text1

        lw      $ra, 20($sp)
        addiu   $sp, $sp, 24
        jr      $ra
        
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
	
