.data
    vetor: .word 5, 15, 10, 25, 45, 30, 1, 4
    pulaLinha: .asciz "\n"
    msg: .asciz "o valor da soma dos vetores maior que 10 é: "

.text
MAIN:
    la s1, vetor #aqui inicializamos o endereço base do vetor
    li s0, 0 #acumulador de soma

    li t0, 0 #int i = 0
    li t1, 8 #limite de repetições
    li t5, 10 #limite de vetor[i] para a soma

    j LOOP


LOOP:   
    #condição de saída
    bge t0, t1, FIM #se o valor de t0 for maior ou igual que t1, ele sai do loop

    #percorrendo o loop
    slli t3, t0, 2 #calcula o deslocamento de acordo com o incrementador (i * 4)
    add t4, s1, t3 #t4 = s1 (endereço base) + t3 (deslocamento)
    lw t2, 0(t4) #adiciona o valor do endereço do vetor base
    
    #passa direto se o valor atual do vetor for maior que 10 e faz a soma
    ble t2, t5, PULASOMA 

    #soma do vetor maior que 10
    add s0, s0, t2

PULASOMA: 
    #incrementador - i++
    addi t0, t0, 1 

    #enquanto a condição acima não for falsa, ele vai seguir o loop
    j LOOP #


FIM:
    #mostrar mensagem
    li a7, 4
    la a0, msg
    ecall

    # mostrar a soma(s0) dos vetores
    li a7, 1
    mv a0, s0
    ecall

    #pula a linha
    li a7, 4
    la a0, pulaLinha
    ecall
    
    #encerra o programa
    li a7, 10
    ecall