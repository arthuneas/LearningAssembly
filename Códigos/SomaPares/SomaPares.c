#include <stdio.h>
#include <stdlib.h>

int VERIFICAPAR(int numero) {
    if ((numero & 1) == 0){
        return 1; // Retorna 1 se for par
    } 
    else {
        return 0; // Retorna 0 se for ímpar
    }
}

int SOMAPARES(int vetor[], int tamanho) {
    int soma = 0;
    for(int i = 0; i < tamanho; i++) {
        if (VERIFICAPAR(vetor[i]) == 1) {
            soma = soma + vetor[i];
        }
    }

    return soma;
}

int main(){

    int vetor[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    printf("O resultado da soma de pares é: %d\n", SOMAPARES(vetor, 10));
    return 0;
}