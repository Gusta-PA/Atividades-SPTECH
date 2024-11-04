function somarImpares(n1) {
    var numero = n1

    var somaImpares = 0
    for (var nAtual = 0; nAtual < numero; nAtual++) {
        if(nAtual % 2 == 1){
            somaImpares+= nAtual
        }
    }
    
    return somaImpares
}

console.log(somarImpares(5))

