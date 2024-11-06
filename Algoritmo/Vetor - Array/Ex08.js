function contabilizarImpares(listaNumeros){
    var qtdImpares = 0

    for(var pos = 0 ; pos < listaNumeros.length; pos ++){
        if(isOdd(listaNumeros[pos])){
            qtdImpares++
        }
    }

    return qtdImpares
}

function isOdd(numero){
    return numero % 2 != 0
}

console.log(contabilizarImpares([1,2,3,4,5]))