.data
msg1:       .asciiz "Digite o dividendo: "
msg2:       .asciiz "Digite o divisor: "
msgQ:       .asciiz "\nQuociente: "
msgR:       .asciiz "\nResto: "
nova_linha: .asciiz "\n"

.text

    # Pede o dividendo
    li $v0, 4
    la $a0, msg1
    syscall

    # Lê o dividendo
    li $v0, 5
    syscall
    move $t0, $v0       # $t0 = dividendo

    # Pede o divisor
    li $v0, 4
    la $a0, msg2
    syscall

    # Lê o divisor
    li $v0, 5
    syscall
    move $t1, $v0       # $t1 = divisor

    # Faz a divisão: quociente em LO, resto em HI
    div $t0, $t1        # $t0 / $t1
    mflo $t2            # $t2 = quociente
    mfhi $t3            # $t3 = resto

    # Mostra o quociente
    li $v0, 4
    la $a0, msgQ
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Mostra o resto
    li $v0, 4
    la $a0, msgR
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Fim
    li $v0, 10
    syscall
