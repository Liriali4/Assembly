#Imprimir os pares entre 2 valores dados pelo user

.data
info1:	.asciiz "Digite o valor inicial: "
info2:	.asciiz "Digite o valor final: "
n:      .asciiz "\n"
soma:	.asciiz "Seu somatório: "

.text
#--------------------------- Soliciar valores -------------------------
li $v0,4
la $a0, info1
syscall
li $v0, 5
syscall
move $s0, $v0	#Valor inical

li $v0,4
la $a0, info2
syscall
li $v0, 5
syscall
move $s1, $v0	#valor final

#------------------------- lógica ---------------------
add $t1, $s0, $zero	#Amazenar o valor inicial
li $t5, 0

Encontrar_Par:
    li $t2, 2
    div $t1, $t2
    mfhi $t3            # <-- pega o resto

    bne $t3, $zero, Else # se resto != 0, vai para Else
    #somar
    add $t5, $t5,$t1
    #imprimir
    li $v0, 1
    move $a0, $t1
    syscall    
    li $v0, 4
    la $a0, n
    syscall
    

Else:
    addi $t1, $t1, 1
    slt $t4, $t1, $s1
    bne $t4, $zero, Encontrar_Par

li $v0, 4
la $a0, soma
syscall
li $v0, 1
move $a0, $t5
syscall

li $v0,10
