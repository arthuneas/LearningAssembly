FUNCAO:
    #abrimos espaços da pilha 
    addi sp, sp, -12 
    
    #armazenamos os valores na memória, de 4bytes = 32 bits
    sw ra, 0(sp) 
    sw s0, 4(sp)
    sw s1, 8(sp)




    #agora recuperamos os valores da pilha
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)

    #por fim, fechamos os valores alocados na pilha
    addi sp, sp, 12

    #retornamos para a main
    ret
