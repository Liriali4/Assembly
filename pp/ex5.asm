.data
informacao_importante1: .asciiz "Norma dos dados:\n"
informacao_importante2: .asciiz "Altura em centímetros (ex: 1.65 m = 161 cm)\n"
informacao_importante3: .asciiz "Peso apenas a parte inteira (ex: 42,5 kg = 42 kg)\n\n"
p1:	.asciiz "Digite a sua idade: "
p2:	.asciiz "Digite a sua altura: "
p3:	.asciiz "Digite o seu peso: "
percentual: .asciiz "%\n"
mensagem_maiores_50: .asciiz "Mais de 50 anos: "
mensagem_media_altura: .asciiz "\nMedia de altura (10-20 anos): "
mensagem_percentual_peso_baixo: .asciiz "\nPercentual com peso abaixo de 40kg: "
quebra_linha: .asciiz "\n"

.text
# Inicializar contadores

li $t0, 0      # contador maiores 50
li $t1, 0      # contador entre 10 e 20
li $t2, 0      # soma alturas entre 10 e 20
li $t3, 0      # contador peso menor que 40
li $t4, 0      # contador pessoas

li $v0, 4
la $a0, informacao_importante1
syscall
li $v0, 4
la $a0, informacao_importante2
syscall
li $v0, 4
la $a0, informacao_importante3
syscall

inicio_leitura:
# idade
li $v0,4
la $a0,p1
syscall

li $v0, 5
syscall
move $t5, $v0

# altura
li $v0,4
la $a0,p2
syscall

li $v0, 6
syscall
move $t6, $v0    

# peso
li $v0,4
la $a0,p3
syscall

li $v0, 6
syscall
move $t7, $v0    

# Verificar se idade > 50
li $t8, 50
slt $s0,$t5, $t8
bne $s0,$zero, incrementar_maiores_50

verificar_idade_entre_10_e_20:
li $t8, 10
slt $s0,$t5, $t8
beq $s0,$zero,verificar_peso

li $t8, 20
slt $s0,$t5, $t8
bne $s0,$zero, verificar_peso

add $t2, $t2, $t6                # soma altura
addi $t1, $t1, 1                # incrementa contador entre 10 e 20

verificar_peso:
li $t8, 40
blt $t7, $t8, incrementar_peso_baixo

proxima_pessoa:
addi $t4, $t4, 1                # contador de pessoas
li $t9, 5                       # total de pessoas
blt $t4, $t9, inicio_leitura

j mostrar_resultados

incrementar_maiores_50:
addi $t0, $t0, 1
j verificar_idade_entre_10_e_20

incrementar_peso_baixo:
addi $t3, $t3, 1
j proxima_pessoa

mostrar_resultados:
# Mostrar quantidade com idade > 50
li $v0, 4
la $a0, mensagem_maiores_50
syscall

li $v0, 1
move $a0, $t0
syscall

# Mostrar média de altura entre 10 e 20 anos
li $v0, 4
la $a0, mensagem_media_altura
syscall

# calcular média
div $t2, $t1
mflo $a0
li $v0, 1
syscall

# Mostrar percentual com peso < 40kg
li $v0, 4
la $a0, mensagem_percentual_peso_baixo
syscall

li $t9, 5
mul $t3, $t3, 100    # transformar em porcentagem
div $t3, $t9
mflo $a0
li $v0, 1
syscall
li $v0, 4
la $a0, percentual
syscall

li $v0, 10
syscall
