.data
infop: .asciiz "Digita o 1 valor:"
infos: .asciiz "Digita o 2 valor:"
resultado:	.asciiz "\nO resultado da subtração é: "

.text

li $v0, 4
la $a0, infop
syscall

li $v0, 5
syscall
move $t0,$v0

li $v0, 4
la $a0, infos
syscall

li $v0, 5
syscall
move $t1,$v0

sub $t2, $t0, $t1

li $v0, 4
la $a0, resultado
syscall

li $v0,1
move $a0, $t2
syscall
