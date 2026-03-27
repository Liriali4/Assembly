.data
provincias:    .asciiz "Cabinda\nBenguela\nBié\nHuambo\nHuíla\nNamibe\nKwanza Norte\nKwanza Sul\nMalanje\nLunda Norte\nLunda Sul\nMoxico\nCuando Cubango\nCunene\nLuanda\nZaire\nUíge\nBengo\nCuanza Sul\nCuanza Norte\nMoxico"

.text

li $v0,4
la $a0, provincias
syscall