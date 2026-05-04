.data
    msgEntrada: .asciz "Digite o valor que deseja dobrar: "
    msgFinal: .asciz "O valor do dobro é: "
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

    jal ra, DOBRA #vai para o label DOBRA, faz a função e retorna

    j FIM 


#bloco de função dobra com um argumento apenas
DOBRA:
    slli a0, a0, 1 #vamos dobrar o valor e colocar no próprio a0
    ret #retorna a MAIN


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
