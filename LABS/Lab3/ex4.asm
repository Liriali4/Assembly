.data
final:	.asciiz "\n Fim do programa\n"
info:	.asciiz "LOOP\n"
soma:	.asciiz "\nSomatório: "
n:	.asciiz "\n"

.text
li $v0, 4
la $a0, info
syscall

li $t0,1
li $s0,0

Loop:
mul $t1,$t0,3
add $s0,$s0,$t1

li $v0,1
move $a0,$t1
syscall
li $v0, 4
la $a0, n
syscall

addi $t0,$t0,1

slti $t2,$t0,6
bne $t2, $zero,Loop

li $v0,4
la $a0, soma
syscall
li $v0,1
move $a0, $s0
syscall

li $v0,4
la $a0,final
syscall
li $v0,10
syscall
