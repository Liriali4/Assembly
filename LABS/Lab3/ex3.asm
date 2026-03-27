.data
vector:	.space 16
printf:	.asciiz "Digite os valores\n:"
R:	.asciiz "Seus respectivos dobros\n"
final:	.asciiz "\n\n Fim do programa\n\n"
n:	.asciiz "\n"

.text
li $v0,4
la $a0,printf
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,5
syscall
move $s1,$v0

li $v0,5
syscall
move $s2,$v0

li $v0,5
syscall
move $s3,$v0

la $t0,vector
sw $s0, 0($t0)
sw $s1, 4($t0)
sw $s2, 8($t0)
sw $s3, 12($t0)

li $v0,4
la $a0,R
syscall

li $t1,0
Ler:
lw $t2, vector($t1)
mul $t2, $t2,2

li $v0,1
move $a0, $t2
syscall
li $v0, 4
la $a0,n
syscall

addi $t1,$t1,4

slti $t3, $t1,16
bne $t3, $zero, Ler

li $v0,4
la $a0,final
syscall
li $v0,10
syscall


