function exibirMaior(listaNumeros) {

    var valorMaior = 0

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (listaNumeros[pos] > valorMaior) {
            valorMaior = listaNumeros[pos]
        }
    }

    return valorMaior
}

console.log(exibirMaior([1, 2, 3, 4, 5]))
console.log(exibirMaior([5, 2, 19, 20]))
console.log(exibirMaior([100,200,300]))