function contabilizarIguais(listaNumeros = [], n1) {
    var repeticoes = 0

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (isSame(listaNumeros[pos], n1)) {
            repeticoes++
        }
    }

    return repeticoes
}

function isSame(numeroLista , numero) {
    return numeroLista == numero
}

console.log(contabilizarIguais([1,1,2,3,4], 2))
console.log(contabilizarIguais([1,1,2,3,4], 1))