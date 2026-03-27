.data
vector:	.space 16
final:	.asciiz "\n\n Fim do programa\n\n"
n:	.asciiz "\n"

.text
li $s0,5
li $s1,10
li $s2,15
li $s3,20

la $t0,vector
sw $s0, 0($t0)
sw $s1, 4($t0)
sw $s2, 8($t0)
sw $s3, 12($t0)

li $t1,0

Ler:
lw $t2, vector($t1)

li $v0,1
move $a0, $t2
syscall
li $v0, 4
la $a0,n
syscall

addi $t1,$t1,4

slti $t3, $t1,12
bne $t3, $zero, Ler

li $v0,4
la $a0,final
syscall
li $v0,10
syscall


