.data
msg_base:     .asciiz "Digite a base: "
msg_exp:      .asciiz "Digite o expoente: "
msg_result:   .asciiz "Resultado: "

.text
    # --------- Ler base ----------
    li $v0, 4
    la $a0, msg_base
    syscall

    li $v0, 5
    syscall
    move $t0, $v0   # t0 = base

    # --------- Ler expoente ----------
    li $v0, 4
    la $a0, msg_exp
    syscall

    li $v0, 5
    syscall
    move $t1, $v0   # t1 = expoente

    # --------- Inicializar resultado = 1 ----------
    li $t2, 1       # t2 = resultado
    li $t3, 0       # contador i = 0

Loop:
    beq $t3, $t1, FimLoop   # se i == expoente, sair do loop
    mul $t2, $t2, $t0        # resultado *= base
    addi $t3, $t3, 1         # i++
    j Loop

FimLoop:
    # --------- Imprimir resultado ----------
    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # --------- Encerrar programa ----------
    li $v0, 10
    syscall
