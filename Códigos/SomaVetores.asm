.data
    vetor: .word 10, 20, 30, 40, 50
    msgInicial: .asciz "SOMADOR DE VETORES"
    divisor: .asciz "-------------------------"
    divisorSoma: .asciz "----"
    pulaLinha: .asciz "\n"


.text
MAIN:
    li t0, 0 #inicializa i = 0
    li t1, 5 #inicializa o limite do vetor
    li t2, 0 #inicializa o valor da soma
    la s0, vetor #inicializa o vetor


    # imprime "-------------------------" e pula linha
    li a7, 4
    la a0, divisor
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall

    #imprime uma mensagem fora do loop e pula a linha
    li a7, 4
    la a0, msgInicial
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall

    # imprime "-------------------------" e pula linha
    li a7, 4
    la a0, divisor
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall


    j LOOP
   
    
LOOP:
    bge t0, t1, FIM #condição de saída (i >= n)

    slli t3, t0, 2 #faz o calculo do deslocamento lógico necessário de acordo com o valor de t0 ou "i"
    add t4, s0, t3 #pega o calculo do primeiro endereço do vetor e adiciona ao deslocamento lógico
    lw t5, 0(t4) #pegamos o valor

    add t2, t2, t5 #adiciona valor do vetor

    #t5 é o valor atual do vetor
    #t2 é o somatório

    #printamos o valor dos vetores e pula linha
    li a7, 1
    mv a0, t5
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall

    addi t0, t0, 1 # incrementador (i++)

    j LOOP


FIM:
    # imprime "-------------------------" e pula linha
    li a7, 4
    la a0, divisorSoma
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall


    #imprimir o valor final
    li a7, 1
    mv a0, t2
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall


    #finaliza o programa
    li a7, 10
    ecall