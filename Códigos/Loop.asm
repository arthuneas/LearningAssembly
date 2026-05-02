#equivalente a um for(int i = 0; i <= 4; i++){
#                        printf("%d", i)
#                    }

.data
    msg: .asciz "valor atual é: "
    pulaLinha: .asciz "\n"


.text 
MAIN:
    li t2, 0 #inicializa o inicio (i = 0)
    li t3, 4 #inicializa o limite (4)
    j LOOP #vamos ao loop 


LOOP:
    #condição de saída
    bge t2, t3, FIM #se a condição (i > 4) for verdadeira, contrária ao que queremos, ela finaliza

    #PARTE LÓGICA
    # imprimir a mensagem
    li a7, 4
    la a0, msg
    ecall

    # imprimir o valor de i
    li a7, 1
    mv a0, t2 
    ecall

    # pular uma linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #faremos o incremento (i++)
    addi t2, t2, 1

    #aqui vamos a condição de retorno ao loop
    j LOOP


FIM:

    #finaliza o programa
    li a7, 10
    ecall