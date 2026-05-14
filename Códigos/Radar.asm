.data 
    msgInicial: .asciz "Digite a Velocidade do Carro: "
    msgMultado: .asciz "MULTADO!"
    msgPermitido: .asciz "VELOCIDADE PERMITIDA"
    pulaLinha: .asciz "\n"
    
    limite: .float 80.0


.text
MAIN:
    #passando o limite para um registrador
    la t0, limite #carregando o endereco do limite
    flw ft0, 0(t0) #armazenando o conteudo do endereco


    #printando a mensagem na tela
    li a7, 4
    la a0, msgInicial
    ecall

    #lendo a Velocidade 
    li a7, 6
    ecall
    fmv.s fs0, fa0

    #pulando linha
    li a7, 4
    la a0, pulaLinha
    ecall

    #Lógica de comparação
    flt.s t1, ft0, fs0  #e o valor digitado for menor ou igual ao limite
    beq t1, zero, PERMITIDO

    #imprime de quem foi multado
    li a7, 4
    la a0, msgMultado
    ecall


FIM: 
    li a7, 10
    ecall


PERMITIDO:

    li a7, 4
    la a0, msgPermitido
    ecall
    
    j FIM