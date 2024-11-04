function armazenarPares(listaNumeros) {
    var novaLista = []

    for (var pos = 0; pos < listaNumeros.length; pos++) {

        if (listaNumeros[pos] % 2 == 0) {
            novaLista.push(listaNumeros[pos])
        }
    }

    return novaLista
}

console.log(armazenarPares([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))