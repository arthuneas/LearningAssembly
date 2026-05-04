.data
    msgEntrada: .asciz "Digite o valor que deseja quadruplicar: "
    msgFinal: .asciz "O valor do quadruplicado é: "
    pulaLinha: .asciz "\n"

.text
MAIN:
    #mostra a mensagem inicial
    li a7, 4
    la a0, msgEntrada
    ecall

    #scanneia o valor
    li a7, 5
    ecall
    mv a0, a0 #move de ao para o próprio t0 da função

    jal ra, QUADRUPLICA #vai para o label DOBRA, faz a função e retorna

    j FIM 


QUADRUPLICA:
    addi sp, sp, -4 #puxamos o sp para baixo e cria espaço na pilha de 32 bits ou 4 bytes
    sw ra, 0(sp) #guardamos o endereço dentro de ra, PUSH

    jal ra, DOBRA #o ra original está seguro na memória
    jal ra, DOBRA #o ra original permanece

    lw ra, 0(sp) #antes de sair da função, recuperamos o endereço de ra na memória para o processador
    addi sp, sp, 4 #devolve o espaco que foi pego emprestado subindo o sp para onde estava, POP
    
    ret


DOBRA:
    slli a0, a0, 1 #vamos dobrar o valor e colocar no próprio a0
    ret


FIM:
    mv t1, a0 #move o resultado da função para um registrador temporarário

    #a mensagem do resultado final
    li a7, 4
    la a0, msgFinal
    ecall

    #printa o resultado da função 
    li a7, 1
    mv a0, t1 # o valor de t1 vai a a0, voltamos o resultado de a0 original que foi feito em t1
    ecall

    #pula linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #encerra o programa
    li a7, 10
    ecall