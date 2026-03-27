.data
adi: .asciiz "O resultado da soma é:"
subt: .asciiz "O resultado da subtração é:"
multi: .asciiz "O resultado da multiplicação é:"
restdiv: .asciiz "O resultado do resto da divisão é:"
intdiv: .asciiz "O resultado interio da divisão é:"
quebraDeLinha: .asciiz "\n"

.text

li $s0, 50
li $s1, 100
#Para somar add res_que_recebe,res_com_valor_1,res_com_valor_2  ou  addi res_que_recebe, $zero, valor
add $t0,$s0,$s1

#Para subtrair sub res_que_recebe,res_com_valor_1,res_com_valor_2
sub $t1,$s1,$s0

#Para multiplica mult res_que_recebe,res_com_valor_1,res_com_valor_2
mul $t2,$s0,$s1

#Para dividir dic res_com_valor_1,res_com_valor_2
div $s1,$s0

#move from mfhi- recebe o resto da divisão 
mfhi $t3

#move from mflo- recebe a parte intera
mflo $t4


#ADIÇÃO
li $v0, 4
la $a0, adi
syscall
li $v0, 1
#move $a0, $t0 ou addi $a0,$t0, 0
move $a0, $t0
syscall
li $v0, 4
la $a0, quebraDeLinha
syscall


#SUBTRAÇÃO
li $v0, 4
la $a0, subt
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 4
la $a0, quebraDeLinha
syscall


#MULTIPLICAÇÃO
li $v0, 4
la $a0, multi
syscall
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, quebraDeLinha
syscall


#RESTO DA DIVISÃO
li $v0, 4
la $a0, restdiv
syscall
li $v0, 1
move $a0, $t3
syscall
li $v0, 4
la $a0, quebraDeLinha
syscall


#ADIÇÃO
li $v0, 4
la $a0, intdiv
syscall
li $v0, 1
move $a0, $t4
syscall
li $v0, 4
la $a0, quebraDeLinha
syscall



