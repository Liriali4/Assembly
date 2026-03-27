.data
prompt:      .asciiz "Digite um número para ver a tabuada: "
nova_linha:  .asciiz "\n"
vezes:       .asciiz " x "
igual:       .asciiz " = "

.text

    # Pede o número
    li $v0, 4
    la $a0, prompt
    syscall

    # Lê o número
    li $v0, 5
    syscall
    move $t0, $v0    # $t0 = número digitado

    ###### TABUADA 1
    li $t1, 1
    mul $t2, $t0, $t1

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, vezes
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, igual
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 2
    li $t1, 2
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 3
    li $t1, 3
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 4
    li $t1, 4
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 5
    li $t1, 5
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 6
    li $t1, 6
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 7
    li $t1, 7
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 8
    li $t1, 8
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 9
    li $t1, 9
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### TABUADA 10
    li $t1, 10
    mul $t2, $t0, $t1
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, vezes
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, igual
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, nova_linha
    syscall

    ###### FIM
    li $v0, 10
    syscall
