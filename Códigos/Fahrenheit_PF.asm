.data 
    msgEntrada: .asciz "digite o valor em Celsius para ser Convertido para Fahrenheit: "
    pulaLinha: .asciz "\n"
    msgConversao: .asciz "O valor em Fahrenheit: "

    ajuste: .float 32.0
    fator: .float 1.8



.text
MAIN:
    #carregando o endereço base de ajuste
    la t0, ajuste
    
    flw ft0, 0(t0) #colocando o valor de ajuste num registrador flutuante
    flw ft1, 4(t0) #colocando o valor de fator num registrador flutuante


    #mostrando a mensgagem de inicio
    li a7, 4
    la a0, msgEntrada
    ecall

    #leitura de dados
    li a7, 6
    ecall
    fmv.s fs0, fa0

    #lógica 
    fmul.s ft3, fs0, ft1 #ft2 = C * 1.8
    fadd.s fs1, ft3, ft0 #fs1 = ft2 + 32.0

    #pulando linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #printando na tela
    li a7, 4
    la a0, msgConversao
    ecall

    #printando flutuante na tela
    li a7, 2
    fmv.s fa0, fs1
    ecall

    #encerrando o programa
    li a7, 10
    ecall
