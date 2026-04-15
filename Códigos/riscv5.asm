.data
	msg: .string "hello world\n"


.text
main:
	#codigo padrão para printar mensagem na tela
	li a7, 4
	la a0, msg
	ecall
	
	#codigo padrão para encerramento do código
	li a7, 10
	ecall