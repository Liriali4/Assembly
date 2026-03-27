#Testando loops
.data
q:	.asciiz "\n Fim do loop...\n\n"
printf: .asciiz "HOARA DO LOOP \nDigite o seu nome: "
nome: .space 30

.text
#Solicitar a string
li $v0,4
la $a0, printf
syscall

#ler a string
li $v0, 8
la $a0, nome
li $a1, 29 #defini 20 caracteres no máximo
syscall

li $t0, 0

Loop:
#Exibir
li $v0,4
la $a0,nome
syscall

addi $t0,$t0 1

slti $t1, $t0, 4

bne $t1, $zero Loop

li $v0,4
la $a0, q
syscall

li $v0,10
syscall