.data
	msg_aprovado: .asciz "Aluno Aprovado!"
	msg_printNota: .asciz "Sua Nota é "
	msg_reprovado: .asciz "Aluno Reprovado!"
	nova_linha: .asciz "\n"
	msg_nota: .asciz "digite a nota do aluno: "

.text
main:
	#mostrar a mensagem da solicitação de nota para o usuário
	li a7, 4
	la a0, msg_nota
	ecall

	#ler a nota do aluno
	li a7, 5
	ecall
	mv t0, a0
	
	#definir a nota de corte
	li t1, 60 
	
	#mostra a mensagem da nota do aluno
	li a7, 4
	la a0, msg_printNota
	ecall
	
	#mostra o inteiro da nota em si
	li a7, 1
	mv a0, t0
	ecall
	
	#pula linha
	li a7, 4
	la a0, nova_linha
	ecall
	
	
	#faz a comparação, se verdadeira, vai para o label aprovado
	#se for falso, o programa ignora a instrução e continua para a próxima abaixo
	bge t0, t1, aprovado
	
	
	#caso reprovado:
	#mostra a mensagem de reprovado
	li a7, 4
	la a0, msg_reprovado
	ecall
	
	# pula para a instrução fim, que encerra o programa
	j fim
	
	
	
aprovado:
	#mostra a mensagem de aprovado
	li a7, 4
	la a0, msg_aprovado
	ecall
	

fim:
	li a7, 10
	ecall