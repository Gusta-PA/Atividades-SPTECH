function verificarPrimo(n1) {
    var numero = n1

    var contadorNumeros = 0
    for (contagem = 0; contagem <= numero; contagem++) {
        if (numero % contagem == 0) {
            contadorNumeros++
        }
    }

    if (contadorNumeros == 2) {
        return 'O número é primo'
    }
    return 'O número não é primo'
}

console.log(verificarPrimo(12))