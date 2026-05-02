.data
    msg_EnterA: .asciz "digite o primeiro número: "
    msg_EnterB: .asciz "digite o segundo número: "
    msg_Valorfinal: .asciz "O Valor de S0 é: "
    nova_linha: .asciz "\n"

.text
main:
    #printando a mensagem A
    li a7, 4
    la a0, msg_EnterA
    ecall

    #lenda a resposta do usuário sobre o dado de A
    li a7, 5
    ecall
    mv s1, a0


    #printando a mensagem A
    li a7, 4
    la a0, msg_EnterB
    ecall

    #lenda a resposta do usuário sobre o dado de A
    li a7, 5
    ecall
    mv s2, a0

    #printando a mensagem do resultado de s0
    li a7, 4
    la a0, msg_Valorfinal
    ecall

    #fazendo a comparação condicional
    bge s1, s2, ELSE

    # atribuindo valor ao s0
    li s0, 1

    j FIM

ELSE:
    li s0, 0

    j FIM


FIM:
    #exibindo o valor de s0
    li a7, 1
    mv a0, s0
    ecall

    #pula linha
    li a7, 4
    la a0, nova_linha
    ecall

    li a7, 10
    ecall