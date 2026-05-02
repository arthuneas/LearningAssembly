.data
    vetor: .word 10, 20, 30
    msgSomaTotal: .asciz "a soma total dos vetores é: "
    msgValorInicial: .asciz "o valor inicial do vetor é: "
    msgPrimeiraPosicao: .asciz "o valor do primeiro vetor é: "
    msgSegundaPosicao: .asciz "o valor do segundo vetor é: "
    msgTerceiraPosicao: .asciz "o valor do terceiro vetor é: "
    pulaLinha: .asciz "\n"

.text
main:

    la s1, vetor #carrega o primeiro endereço do vetor em s1
    li s0, 0 #inicializa s0 em 0

    #PRINTA O VALOR INICIAL DO VETOR
    li a7, 4
    la a0, msgValorInicial
    ecall
    #imprime o inteiro em s0
    li a7, 1
    mv a0, s0 
    ecall
    #pular a linha
    li a7, 4
    la a0, pulaLinha
    ecall
    

    lw t0, 0(s1) #carrega o valor na primeira posição do vetor (10) e armazena em t0
    add s0, t0, s0 #soma o valor de t0 (10) e adiciona em s0 (0) no próprio s0(10)

    #PRINTA O VALOR ATUAL DO VETOR
    li a7, 4
    la a0, msgPrimeiraPosicao
    ecall
    #imprime o inteiro em s0
    li a7, 1
    mv a0, s0 
    ecall
    #pular a linha
    li a7, 4
    la a0, pulaLinha
    ecall


    addi s1, s1, 4 #aqui andando o ponteiro do vetor, ou seja, 0(s1) sai de a[0] e vai para a[1]


    lw t1, 0(s1) #carrega o valor da segunda posição do vetor em t1
    add s0, t1, s0 #soma o valor de s0(10) com o valor de t1(20) e armazena em s0(30)

    #PRINTA O VALOR ATUAL DO VETOR
    li a7, 4
    la a0, msgSegundaPosicao
    ecall
    #imprime o inteiro em s0
    li a7, 1
    mv a0, s0 
    ecall
    #pular a linha
    li a7, 4
    la a0, pulaLinha
    ecall


    addi s1, s1, 4 #aqui andamos o ponteiro do vetor, sai de 0(s1) de a[1] para a[2]

    lw t2, 0(s1) #carrega a terceira posição do vetor em t2
    add s0, t2, s0 #aqui somamos o valor de s0(30) com o valor de t2(30) e armazena em t2


    #PRINTA O VALOR ATUAL DO VETOR
    li a7, 4
    la a0, msgTerceiraPosicao
    ecall
    #imprime o inteiro em s0
    li a7, 1
    mv a0, s0 
    ecall
    #pular a linha
    li a7, 4
    la a0, pulaLinha
    ecall


    j FIM

FIM: 
    #PRINTA A SOMA FINAL
    # printa a mensagem
    li a7, 4
    la a0, msgSomaTotal
    ecall

    #imprime o inteiro em s0
    li a7, 1
    mv a0, s0 
    ecall

    #pular a linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #finalizar o programa
    li a7, 10
    ecall

