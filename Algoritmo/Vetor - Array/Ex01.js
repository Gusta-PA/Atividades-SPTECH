function somarElementos(listaNumeros = []) {
    
    if (listaNumeros.length == 0) {
        return 0
    }
    
    if (!Array.isArray(listaNumeros)) {
        return 'Digite valores para uma lista'
    }
    
    var somatoria = 0
    
    for (var pos = 0; pos < listaNumeros.length; pos++) {
        somatoria += listaNumeros[pos]
    }
    
    return somatoria
}

console.log(somarElementos([1, 2, 3]))
console.log(somarElementos([4, 5, 6]))
console.log(somarElementos([7, 8, 9]))
console.log(somarElementos())

