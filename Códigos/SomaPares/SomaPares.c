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
    
    return 0;
}