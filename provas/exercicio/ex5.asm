.data
mensagem_maiores_50: .asciiz "Mais de 50 anos: "
mensagem_media_altura: .asciiz "\nMedia de altura (10-20 anos): "
mensagem_percentual_peso_baixo: .asciiz "\nPercentual com peso abaixo de 40kg: "
quebra_linha: .asciiz "\n"

.text
    # Inicializar contadores e acumuladores
    li $t0, 0      # contador_maiores_50
    li $t1, 0      # contador_entre_10_e_20
    li $t2, 0      # soma_alturas_entre_10_e_20
    li $t3, 0      # contador_peso_menor_que_40
    li $t4, 0      # contador_pessoas

inicio_leitura:
    li $v0, 5
    syscall
    move $t5, $v0    # idade

    li $v0, 5
    syscall
    move $t6, $v0    # altura

    li $v0, 5
    syscall
    move $t7, $v0    # peso

    # Verificar se idade > 50
    li $t8, 50
    bgt $t5, $t8, incrementar_maiores_50

verificar_idade_entre_10_e_20:
    li $t8, 10
    blt $t5, $t8, verificar_peso
    li $t8, 20
    bgt $t5, $t8, verificar_peso
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

    div $t2, $t1         # calcular média
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

    # Finalizar programa
    li $v0, 10
    syscall
