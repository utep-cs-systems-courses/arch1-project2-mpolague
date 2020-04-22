	.arch mps430g2553 
	.p2align 1,0

	.data
state:
	.word 0 //state starts on 0

	.text
jt: //this is the jump table
	.word out
	.word option1
	.word option2
	.word option3
	.word option4

	.global advance //name of function 
advance:cmp #5,state //checking if input is within the options
	jnc out //jump if not carry, jump if it is not within the range
	mov &state, r12 //state to reg
	add r12,r12 //adds them to align to correct addresses 
	mov jt(r12), r0 //uses jt as an offset for r12

option1:pushl song1 //pushes song1 to the stack
	call #buzzer_set_period //calls function
	mov #0,&state //set state = 0
	jmp out //jumps out

option2:call #_state_advance //calls function
	jmp out //jumps out

option3:call #buzzer_off //calls function
	jmp out //jumps out

option4:pushl song2 //pushes song2 onto stack
	call #buzzer_set_period //calls function
	jmp out //jumps out

out:	pop r0 //this is like a break statement
