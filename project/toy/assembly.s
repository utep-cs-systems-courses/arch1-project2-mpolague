	.arch mps430g2553
	.p2align 1,0

	.data
state:
	.word 0

	.text
jt:
	.word out
	.word option1
	.word option2
	.word option3
	.word option4

	.global advance
advance:cmp #5,state
	jnc out
	mov &state, r12
	add r12,r12
	mov jt(r12), r0

option1:pushl song1
	call #buzzer_set_period
	mov #0,&state
	jmp out

option2:call #_state_advance
	jmp out

option3:call #buzzer_off
	jmp out

option4:pushl song2
	call #buzzer_set_period
	jmp out

out:	pop r0
