.data 
	msg1: .asciz "Digite o primeiro número: "
	msg2: .asciz "Digite o segundo número: "
	msg3: .asciz "O resultado da subtração é: "	
.text	
main:
	li a7, 4 #addi a7, 4, zero
	la a0, msg1 #mostra a mensagem
	ecall #chamada do sistema para fazer
	
	li a7, 5 #faz a leitura do teclado
	ecall #chamada o sistema
	mv t0, a0 #armazena o valor em t0
	
	
	li a7, 4 #codigo universal para mostrar mensagem na tela
	la a0, msg2 #mostra a mensagem
	ecall #chamada o sistema
	
	li a7, 5 #faz a leitura do teclado para o valor da mensagem 2 e sobreescreve a anterior
	ecall #chamada o sistema
	mv t1, a0 #armazena o valor do teclado em um outro registrador
	
	sub t2, t0, t1 #operação de subtração
	
	
	#mostrar o resultado da operação
	li a7, 4 #addi a7, 4, zero
	la a0, msg3 #mostra a mensagem
	ecall #chamada do sistema para fazer
	
	li a7, 1 #mostra o inteiro na tela
	mv a0, t2 #mostra o valor armazenado na subtração
	ecall
	
	
	li a7, 10 #encerra o programa
	ecall	