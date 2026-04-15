.data 
	msg: .asciz "a pontuação final do jogador é: "
	
.text
main:
	li t0, 50 #carrega o imediato no registrador
	addi t0, t0, 15
	addi t0, t0, -8
	
	#mostrar mensagem na tela
	li a7, 4
	la a0, msg
	ecall
	
	#mostrar inteiro na tela
	li a7, 1
	mv a0, t0
	ecall
	
	#encerrar programa
	li a7, 10
	ecall
	
	