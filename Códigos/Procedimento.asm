.data
    vetor: .word 5, 15, 10, 25, 45, 30, 1, 4
    pulaLinha: .asciz "\n"
    msg: .asciz "o valor da soma dos vetores maior que 10 é: "

.text
MAIN:
    la a0, vetor #aqui inicializamos o endereço base do vetor
    li a1, 8 #limite de repetições / tamanho do vetor

    jal ra, SOMA_MAIORES

    j FIM



SOMA_MAIORES: 
    li t5, 0 #acumulador de soma
    li t0, 0 #int i = 0
    li t1, 10 #limite de vetor[i] para a soma

    LOOP:   
        #condição de saída
        bge t0, a1, FIMFUNCAO #se o valor de t0 for maior ou igual que a1, ele sai do loop

        #percorrendo o loop
        slli t3, t0, 2 #calcula o deslocamento de acordo com o incrementador (i * 4)
        add t4, a0, t3 #t4 = a0 (endereço base) + t3 (deslocamento)
        lw t2, 0(t4) #adiciona o valor do endereço do vetor base
        
        #passa direto se o valor atual do vetor for maior que 10 e faz a soma
        ble t2, t1, PULASOMA 

        #soma do vetor maior que 10
        add t5, t5, t2

    PULASOMA: 
        #incrementador - i++
        addi t0, t0, 1 

        #enquanto a condição acima não for falsa, ele vai seguir o loop
        j LOOP 


    FIMFUNCAO:
        mv a0, t5 #movemos o valor temporário ao argumento da função
        ret #sai da função


FIM:
    mv t0, a0

    #mostrar mensagem
    li a7, 4
    la a0, msg
    ecall

    mv a0, t0

    # mostrar a soma(s0) dos vetores
    li a7, 1
    mv a0, a0
    ecall

    #pula a linha
    li a7, 4
    la a0, pulaLinha
    ecall
    
    #encerra o programa
    li a7, 10
    ecall