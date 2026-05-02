#endereço alvo = endereco base + (indice * [tamanho do dado == 4])
#SLLI faz a multiplicação por potencias de 2: slli destino, origem, quantidade de casas por potencia de 2. 1 (== 2), 2(== 4), 3(== 8)...


.data
    vetor: .word 10, 20, 30, 40, 50
    msgPedeIndice: .asciz "Digite o indice (0 a 4) que deseja ler: "
    msgResultado: .asciz "O valor nessa posicao e: "
    pulaLinha: .asciz "\n"


.text
main:
    # PARTE INICIAL
    la s1, vetor            # s1 = Endereço base do vetor

    # Pede o índice para o usuário
    li a7, 4
    la a0, msgPedeIndice
    ecall

    # Lê o índice digitado e guarda em t2 (nosso 'i')
    li a7, 5
    ecall
    mv t2, a0


    # PARTE LÓGICA
    slli t3, t2, 2 #pegamos o valor digitado, multiplicamos pelo tamanho dos dados, o dado é um byte, pulamos de 4 em 4
    add t4, s1, t3 #adicionamos o valor necessário do deslocamento em t3 e armazenamos em t4
    #acessamos o nono ponteiro com o valor de t4, aqui há o valor do endereço inicial + o deslocamente necessário para encontrar o valor
    #assim, teremos que buscar o primeiro valor de t4 que é s1 + t3.
    #com o novo endereço, vamos nessa posição exata acessando 0(registrador com o endereço). pois o deslocamento foi feito previamente.
    lw t0, 0(t4) 


    # PARTE FINAL
    # Imprime a mensagem de resultado
    li a7, 4
    la a0, msgResultado
    ecall

    # Imprime o valor que você buscou (que deve estar no t0)
    li a7, 1
    mv a0, t0
    ecall

    # Pula linha
    li a7, 4
    la a0, pulaLinha
    ecall

    # Encerra
    li a7, 10
    ecall