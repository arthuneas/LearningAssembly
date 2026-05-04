#código base em C
#int i = 3;
#A[i] = 10;


.text
MAIN:
    #o inicio do vetor está em s0

    li t0, 3 #int i = 3
    slli t1, t0, 2 # t1 = 3 * deslocamento em byte
    add t1, s0, t1 # adiciona o valor do endereço base do vetor ao deslocamento

    li t2, 10 #carrega o valor 10 em t2
    sw t2, 0(t1) #coloca o 10 na posição a[3]