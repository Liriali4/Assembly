.data
q:	.asciiz "\n"
printf:	.asciiz "Digite um nº inteiro: "
x:	.asciiz " x "
igual:	.asciiz "= "
final:	.asciiz "\n\n Fim do programa\n\n"

.text
li $v0, 4
la $a0, printf
syscall

li $v0, 5
syscall
move $s0,$v0

li $t0, 0

#Função para exibir
Linha:

mul $t1, $s0,$t0

li $v0,1
move $a0, $s0
syscall

li $v0,4
la $a0, x
syscall

li $v0,1
move $a0,$t0
syscall

li $v0, 4
la $a0, igual
syscall

li $v0,1
move $a0, $t1
syscall

li $v0, 4
la $a0, q
syscall

#Incrementar o $t0
addi $t0, $t0,1

#verificar se a contagem excedeu o 12
slti $t2,$t0,12

#condição para loop
bne $t2, $zero, Linha

#Encerrando o programa
li $v0,4
la $a0, final
syscall

li $v0, 10
syscall


