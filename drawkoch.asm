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

.text

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
	li $a2, 5
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
	li $a2, 5
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
	li $a2, 5
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
	li $a2, 5
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
	li $a2, 5
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
	li $a2, 5
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
	li $a2, 5
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
	
	li $v0,12
	syscall
	
	#clears the screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 512
	jal DrawBox
######################################################################################################	
######################################################################################################	
	#second iteration
	#this iteration will have 4 additional 60 degree turns in it
	
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
	li $a2, 5
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
	li $a2, 3
	li $a3, 7
	jal DrawBox
	
	li $a0, 310 #might be more useful for iteration 2
	li $a1, 200
	li $a2, 3
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
	li $a2, 5
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
	





exit_program:			#exits the program
	li      $v0, 10
        syscall



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
	
################################################################
#draw a diagonal line Up
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
