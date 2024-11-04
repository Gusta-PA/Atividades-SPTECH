function identificarNumero(n1) {
    if (n1 > 0) {
        return 'O número é Positivo'
    } else if (n1 < 0) {
        return 'O número é negativo'
    }
    
    return 'O número é 0'

}

// resultado = identificarNumero(30)
// 'O número é Positivo'

//  resultado = identificarNumero(-30)
// 'O número é negativo'

//  resultado = identificarNumero(0)
// 'O número é 0'