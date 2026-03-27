.data
msg:     .asciiz "Digite um número: "
espaco:  .asciiz " "
fim:     .asciiz "\n\nFim do programa\n\n"

.text
# Mensagem ao user
li $v0, 4
la $a0, msg
syscall

# Leitura do número
li $v0, 5
syscall
move $s0, $v0      # $s0 = n

li $t0, 0          # i = 0

Loop:
    bge $t0, $s0, Fim  # enquanto i < n

    move $a0, $t0
    jal Fibonacci      # chama o procedimento
    move $a0, $v0      # resultado para imprimir

    li $v0, 1
    syscall

    li $v0, 4          # imprime espaço
    la $a0, espaco
    syscall

    addi $t0, $t0, 1
    j Loop

Fim:
    li $v0, 4
    la $a0, fim
    syscall

    li $v0, 10
    syscall

# -------------------------------
# Procedimento Fibonacci(n)
# Entrada: $a0
# Retorno: $v0
# -------------------------------
Fibonacci:
    addi $sp, $sp, -8     # reserva espaço na pilha
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    li $v0, 0
    beq $a0, $zero, FimFib

    li $v0, 1
    li $t1, 1
    beq $a0, $t1, FimFib

    # Fib(n-1)
    addi $a0, $a0, -1
    jal Fibonacci
    move $t2, $v0         # guarda Fib(n-1)

    # Fib(n-2)
    lw $a0, 0($sp)
    addi $a0, $a0, -2
    jal Fibonacci
    add $v0, $v0, $t2     # Fib(n) = Fib(n-1) + Fib(n-2)

FimFib:
    lw $ra, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 8
    jr $ra
