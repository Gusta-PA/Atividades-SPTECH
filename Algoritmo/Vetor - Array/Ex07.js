function contabilizarPares(listaNumeros = []) {
    var paresTotais = 0

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (isEven(listaNumeros[pos])) {
            paresTotais++
        }
    }
    return paresTotais
}

function isEven(numero) {
    return numero % 2 == 0
}

console.log(contabilizarPares([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
console.log(contabilizarPares([1, 2, 3, 4, 5, 6]))
console.log(contabilizarPares([1,3,5]))

