function exibirMaiores(listaNumeros = [], n1) {

    var vetorMaiores = []

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (listaNumeros[pos] > n1) {
            vetorMaiores.push(listaNumeros[pos])
        }
    }

    return vetorMaiores
}

console.log(exibirMaiores([1, 2, 3, 4, 5], 2))
console.log(exibirMaiores([8, 2, 12, 24, 0], 3))
console.log(exibirMaiores([9, 8, 7, 6, 5, 4], 4))