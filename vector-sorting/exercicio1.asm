.data

# Alocar espaço de 40 bytes na memória para 10 inteiros
vetor: .space 40

msg1: .asciiz "\nDigite um inteiro: "
msg2: .asciiz "\nValores ordenados:\n"
newline: .asciiz "\n"
MAX: .word 10

.text

main:
    # Tomando endereço base!
    la $s0, vetor

    # Usando $t1 como índice multiplo de 4!
    # Garantindo que inicie com valor zero
    add $t1, $zero, $zero

    # Numero de iteracoes
    lw $t2, MAX

Loop:
    sll $t3, $t1, 2         # Fazendo com que $t3 = 4 * $t1
    add $t3, $s0, $t3       # Fazendo com que $t3 fique com o valor 'deslocamento + end. base'

    # Mensagem...
    la $a0, msg1
    addi $v0, $zero, 4
    syscall

    # Leitura do número...
    addi $v0, $zero, 5
    syscall

    add $t0, $v0, $zero

    # Gravando número na memória...
    sw $t0, 0($t3)

    # Incrementando indice
    addi $t1, $t1, 1

    # Testando para manter o laco
    beq $t1, $t2, ordena

    j Loop

ordena:
    li $t4, 1                # Flag para verificação de troca

bubble_sort:
    beqz $t4, imprime       # Se nenhuma troca foi feita, o vetor está ordenado
    li $t4, 0               # Reseta a flag de troca
    li $t0, 0               # Reinicia o índice interno

bubble_loop:
    la $t2, vetor            # Carrega o endereço base do vetor
    sll $t1, $t0, 2          # Calcula o offset do índice (t0 * 4)
    add $t5, $t2, $t1        # Endereço do elemento atual
    lw $t6, 0($t5)           # Carrega o elemento atual
    lw $t7, 4($t5)           # Carrega o próximo elemento
    ble $t6, $t7, no_swap    # Se o elemento atual <= próximo, não faz a troca
    sw $t7, 0($t5)           # Caso contrário, troca os elementos
    sw $t6, 4($t5)
    li $t4, 1                # Marca que houve troca

no_swap:
    addi $t0, $t0, 1         # Incrementa o índice interno
    li $t3, 9                # Número de elementos - 1 para o laço de ordenação
    blt $t0, $t3, bubble_loop # Se ainda há elementos para comparar, continua no loop interno
    subi $t3, $t3, 1         # Diminui o número de elementos para o próximo ciclo
    j bubble_sort            # Repete o processo de ordenação

imprime:
    # Mensagem...
    la $a0, msg2
    addi $v0, $zero, 4
    syscall

    li $t0, 0                # Reinicia o índice para a impressão
    li $t1, 10               # Número de elementos no vetor

print_loop:
    beq $t0, $t1, Exit       # Se todos os elementos foram impressos, termina o programa
    la $t2, vetor            # Carrega o endereço base do vetor
    sll $t3, $t0, 2          # Calcula o offset do índice (t0 * 4)
    add $t2, $t3, $t2        # Adiciona o offset ao endereço base
    lw $a0, 0($t2)           # Carrega o valor do vetor
    li $v0, 1                # Código do serviço para impressão de inteiro
    syscall

    la $a0, newline          # Carrega o endereço da nova linha
    li $v0, 4                # Código do serviço para impressão de string
    syscall

    addi $t0, $t0, 1         # Avança para o próximo elemento
    j print_loop             # Repete a impressão

Exit:
    # Encerrando programa...
    addi $v0, $zero, 10
    syscall
