.data
msg:	.asciiz "Resolve a seguinte expressão: f = (g + h) ? (i + j); \n\n"
resultado:	.asciiz "O resultado é: "

.text

li $v0, 4
la $a0, msg
syscall

li $s0,6
li $s1,10
li $s2, 4
li $s3, 2

add $t0, $s0,$s1
add $t1, $s2, $s3

sub $t3, $t0, $t1

li $v0, 4
la $a0, resultado
syscall

li $v0, 1
move $a0, $t3
syscall
