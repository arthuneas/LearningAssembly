.data
    #declarando um vetor estatico com elemento definidos
    vetor: .word 10, 20, 30, 40, 50
    msg: .asciz "o valor de a[2] é: "
    pulaLinha: .asciz "\n"

.text
main:
    #carregando no registrador s1, o endereco base do vetor
    la s1, vetor

    #carregando no registrador s0, o valor imediato 5
    li s0, 5

    #carregar do vetor, o valor que está ma primeira posição e armezená-lo em um registrador temporário
    lw t0, 0(s1)

    #fazer a soma de t0(a[0] == 10) e s0(5)
    add t1, t0, s0

    #aqui armazena-se o valor da soma e subescreve o valor que ja estava em A[2]
    sw t1, 8(s1)

    j FIM


FIM:
    #printar a mensagem declarada
    li a7, 4
    la a0, msg
    ecall

    #printar o valor da soma
    li a7, 1
    mv a0, t1
    ecall

    #pular linha para deixar o terminal decente
    li a7, 4
    la a0, pulaLinha
    ecall

    li a7, 10
    ecall

