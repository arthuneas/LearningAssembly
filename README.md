<div align="center">

# ✧ Learning Assembly RISC-V ✧

*Repositório dedicado ao estudo prático e teórico de programação em Assembly RISC-V para a disciplina de Organização e Arquitetura de Computadores (OAC).*

<img src="https://img.shields.io/badge/Language-Assembly_RV32I-bcaee0?style=flat-square" alt="Language">
<img src="https://img.shields.io/badge/Simulator-RARS_1.6-f5c2e7?style=flat-square" alt="Simulator">
<img src="https://img.shields.io/badge/Focus-Computer_Architecture-cba6f7?style=flat-square" alt="Focus">

---

</div>

## Conteúdos Abordados

A jornada de aprendizado está dividida em degraus fundamentais da arquitetura RISC-V:

### 1. Aritmética e Registradores

Operações matemáticas básicas e gerenciamento de registradores:

* Registradores salvos (`s0–s11`)
* Registradores temporários (`t0–t6`)

### 2. Acesso à Memória (Load/Store)

* Leitura com `lw` e escrita com `sw`
* Memória endereçada por byte
* Words ocupam **4 bytes** (offset de 4 em 4)

### 3. Controle de Fluxo e Condicionais

* IF/ELSE com:

  * `beq`, `bne`, `bge`, `blt`
* Saltos incondicionais:

  * `j`

### 4. Laços de Repetição (Loops)

* Implementação de `for` e `while`
* Uso de:

  * Aritmética de ponteiros
  * Ponteiro andarilho

### 5. Procedimentos e Pilha (Stack)

* Uso de `jal` e `ret`
* Manipulação do `sp` (Stack Pointer)
* Preservação do `ra` (return address)
* Evita loops infinitos em chamadas aninhadas

### 6. Linguagem de Máquina e Hexadecimal

* Tipos de instrução:

  * Tipo-R, Tipo-I, Tipo-S, Tipo-B
* Aplicação de **Little-Endian** na memória

---

## Dicas

### - Regra da Pilha

Toda função deve deixar o `sp` exatamente como encontrou.

```assembly
addi sp, sp, -4   # abre espaço
...
addi sp, sp, 4    # fecha espaço
```

### - Pegadinha do Offset

Não é permitido usar registradores como offset.

 Errado:

```assembly
lw t0, t1(s0)
```

 Correto:

```assembly
addi s0, s0, 4
lw t0, 0(s0)
```

### - Little Endian na Memória

A ordem dos bytes é invertida na RAM.

Exemplo:

```
00 55 26 23  (no papel)
↓
23 26 55 00  (na memória)
```

---

## Como Executar os Códigos

Para compilar e rodar os códigos Assembly diretamente pelo terminal do VS Code:

### Pré-requisitos

* Java instalado
* Arquivo `rars1_6.jar` disponível no arquivo "Códigos"

### Passo a passo

1. Abra o terminal integrado do VS Code
2. Navegue até a pasta dos códigos:

```bash
cd ./LearningAssembly/Códigos
```

1. Execute o programa:

```bash
java -jar ../rars1_6.jar seu_codigo.asm
```
