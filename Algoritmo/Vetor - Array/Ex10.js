function todosPositivos(listaNumeros = []) {

    for (var pos = 0; pos < listaNumeros.length; pos++) {
        if (listaNumeros[pos] < 0) {
            return false
        }
    }

    return true
}

console.log(todosPositivos([1, 2, 3, 4, 5]))
console.log(todosPositivos([1, 2, 3, 4, -5]))
console.log(todosPositivos([1, 2, 3, 0, 5]))
