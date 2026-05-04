.data   
    pulaLinha: .asciz "\n"
    msgInicial: .asciz "--- SOMA DE PARES ---"
    msgResultadoSomaPares: .asciz "O resultado da soma de pares é: "
    vetor: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


.text
MAIN:
    li a7, 4
    la a0, msgInicial
    ecall

    li a7, 4
    la a0, pulaLinha
    ecall

    la a0, vetor #carrega o endereço de mem
    li a1, 10

    jal ra, SOMAPARES

    j FIM



# FUNÇÃO VERIFICA_PAR
VERIFICAPAR:
    andi t6, a0, 1 #analisa se o ultimo bit é par(0) ou impar(1)
    beq t6, zero, PAR #se o ultimo bit for 0, ele vai para a função PAR
    li a0, 0 #se for impar, retorna 0
    ret

PAR:
    li a0, 1 #se for par, retorna 1
    ret



SOMAPARES:
    
    #fazendo pilha e salvando tudo primeiro
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    mv s1, a0 #s1 é nosso endereço base
    mv s2, a1 #s2 é nosso limite seguro
    li t5, 0 #t5 será o somatório
    li t0, 0 #t0 será o i


    LOOP: 
        beq t0, s2, FIMLOOP

        slli t1, t0, 2
        add t2, s1, t1
        lw t3, 0(t2)

        mv a0, t3
        jal ra, VERIFICAPAR

        beq a0, zero, PULASOMA

        add t5, t5, t3


    PULASOMA:
        addi t0, t0, 1
        j LOOP


    FIMLOOP:
        mv a0, t5 #movemos o valor da soma ao vetor 


    lw ra, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12

    ret


FIM:
    #movendo o retorno da função para um registrador temporário
    mv t0, a0

    #printar a mensagem
    li a7, 4
    la a0, msgResultadoSomaPares
    ecall

    #printar o resultado da soma
    li a7, 1
    mv a0, t0
    ecall

    #pular linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #encerramento do programa
    li a7, 10
    ecall