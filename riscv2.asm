.data
	msg_resultado: .asciz "O resultado do perimetro é: "

.text
main:
	li t0, 15 #carrega o imediato/constante 15 em t0, base
	li t1, 8 #carrega o imediato/constante 8 em t1, altura
	
	add t2, t0, t0 #dobra o valor de t0 e armazena em t2, altura
	add t3, t1, t1 #dobra o valor de t0 e armazena em t2, base
	
	add t4, t3, t2 #faz a soma final, perimetro
	
	li a7, 4 #mostra string na tela
	la a0, msg_resultado #imprime a mensagem do resultado
	ecall	
	
	li a7, 1 #mostra inteiro na tela
	mv a0, t4 #carrega t4 em a0
	ecall
	
	
	li a7, 10 #encerramento do programa
	ecall
