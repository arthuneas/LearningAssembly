# Código em C
#int f;
#int g = 10;
#int h = 20;
#int i = 5;
#int j = 2;

#f = (g + h) - (i + j);

#Código em assembly
.data 
    msg: .asciz "o resultado da expressão é: "


.text
main:
    li s1, 10 #carrega o imediato no registrador temporário, "inicializando a variável"
    li s2, 20
    add t0, s1, s2 #(g + h)

    li s3, 5
    li s4, 2
    add t1, s3, s4 #(i + j)

    sub s0, t0, t1 #subtração entre os termos acima

    #mostrar os resultados da soma com a mensagem
    li a7, 4
    la a0, msg
    ecall

    li a7, 1
    mv a0, s0
    ecall

    li a7, 10
    ecall