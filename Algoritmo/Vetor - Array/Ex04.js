function exibirMédia(listaNumeros) {
    var somatoria = 0

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        somatoria += listaNumeros[pos]
    }

    var mediaVetor = somatoria / listaNumeros.length

    return mediaVetor
}

console.log(exibirMédia([1,2,3]))
console.log(exibirMédia([10,10,10]))
console.log(exibirMédia([5,5,5]))