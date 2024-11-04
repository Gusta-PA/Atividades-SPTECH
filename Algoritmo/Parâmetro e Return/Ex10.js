function retornarFatorial(n1) {
    var numero = n1

    var resultadoFatorial = 1
    for (var numeroAtual = 1; numeroAtual <= numero; numeroAtual++) {
            resultadoFatorial *= numeroAtual
    }
    return resultadoFatorial
}
console.log(retornarFatorial(7))