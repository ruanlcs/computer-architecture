# Programa MIPS: Ordenação de Vetor com Bubble Sort

Este programa em linguagem assembly para arquitetura MIPS lê 10 valores inteiros do usuário, armazena-os em um vetor e os ordena usando o algoritmo Bubble Sort. Após a ordenação, os valores são exibidos na saída.

## Estrutura do Código

### Seção de Dados

- `vetor`: Espaço de 40 bytes alocado para armazenar 10 inteiros.
- `msg1`: Mensagem que solicita ao usuário para digitar um inteiro.
- `msg2`: Mensagem que informa ao usuário que os valores serão exibidos.
- `newline`: Sequência de nova linha para formatação da saída.
- `MAX`: Valor que indica o número de elementos a serem lidos (10).

### Seção de Texto (Código)

1. **main**:
    - Inicializa variáveis e define o endereço base do vetor.

2. **Loop**:
    - Solicita ao usuário que digite um inteiro, lê o valor e o armazena no vetor.
    - Repete até que 10 valores sejam lidos.

3. **ordena**:
    - Inicia a ordenação dos valores usando o algoritmo Bubble Sort.

4. **bubble_sort**:
    - Implementa o algoritmo Bubble Sort para ordenar o vetor.

5. **imprime**:
    - Exibe os valores ordenados do vetor.

6. **Exit**:
    - Encerra o programa.

## Execução

Para executar este programa, siga os passos abaixo:

1. Abra o simulador MIPS (por exemplo, MARS ou SPIM).
2. Carregue o arquivo do código assembly.
3. Monte o programa para verificar se há erros de montagem.
4. Execute o programa.
5. Siga as instruções na saída do console para digitar os valores inteiros.
6. Veja os valores ordenados exibidos no console.

