function exibirMenor(listaNumeros) {
    var valorMenor = Infinity

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (listaNumeros[pos] < valorMenor) {
            valorMenor = listaNumeros[pos]
        }
    }

    return valorMenor
}

console.log(exibirMenor([10, 3, 2, 100]))
console.log(exibirMenor([1,2,3,4,5]))