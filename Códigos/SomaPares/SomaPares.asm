.data



.text
MAIN:




# FUNÇÃO VERIFICA_PAR
VERIFICAPAR:
    andi t0, a0, 1 #analisa se o ultimo bit é par(0) ou impar(1)
    beq t0, zero, PAR #se o ultimo bit for 0, ele vai para a função PAR
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
        slli t1, t0, 2
        add t2, s1, t1
        lw 





    j LOOP



    lw ra, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12