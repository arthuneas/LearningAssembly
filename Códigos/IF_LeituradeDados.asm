.data
	questIdade: .asciz "Digite a sua Idade: "
	questNome: .asciz "Digite o seu Nome: "
	msgConvidado: .asciz "Bem vindo, "
	msgBloqueado: .asciz "Sua entrada foi negada, "
	nomeDigitado: .space 50
	msgIdade: .asciz "a Idade informada foi de: "
	pulaLinha: .asciz "\n"
	
.text
main:
	#código padrâo para printar na tela
	li a7, 4
	la a0, questIdade #carrega a mensagem
	ecall
	
	#codigo padrâo para leitura de dados, leitura de idade
	li a7, 5 
	ecall
	mv t0, a0 # move o valor mandado pelo usuario (a0) em um registrador
	
	
	#código padrâo para printar na tela
	li a7, 4
	la a0, questNome #carrega a mensagem
	ecall
	
	#leitura de nome
	li a7, 8
	la a0, nomeDigitado #carregamos o endereço de memória do buffer
	li a1, 50 # carrega um valor imediato para um registrador do mesmo tamanho do .space
	ecall
	
	li t2, 18 #armzena o imadiato 18 em t2 para comparação
	
	#pular a linha
	li a7, 4
	la a0, pulaLinha
	ecall
	
	#printar a idade
	li a7, 4 #printar mensagem na tela
	la a0, msgIdade #carrega a mensagem
	ecall

	li a7, 1 #codigo para mostrar o imediato
	mv a0, t0 #carrega a idade
	ecall	
	
	#pular a linha
	li a7, 4
	la a0, pulaLinha
	ecall
	
	blt t0, t2, bloqueado #comparação se for menor
	
	#código padrâo para printar na tela
	li a7, 4
	la a0, msgConvidado #carrega a mensagem
	ecall
	
	li a7, 4
	la a0, nomeDigitado #carrega o nome
	ecall
	
	j fim
	
	
bloqueado:
	#código padrâo para printar na tela
	li a7, 4
	la a0, msgBloqueado #carrega a mensagem
	ecall
	
	li a7, 4
	la a0, nomeDigitado #carrega o nome
	ecall


fim:
	li a7, 10
	ecall