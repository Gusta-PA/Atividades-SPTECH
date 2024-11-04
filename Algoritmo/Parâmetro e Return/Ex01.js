function identificarNumeros(n1, n2) {
    if (n1 > n2) {
        return n1
    } else if (n1 < n2) {
        return n2
    } else {
        return 'Os Números são iguais'
    }
}

// Primeiro Teste
// resultado = identificarNumeros (30,10)
// retorno = 30

// Segundo teste
// resultado = identificarNumeros(10,20)
// retorno = 20