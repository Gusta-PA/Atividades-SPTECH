function somaDeValores(vetor1 = [], vetor2 = []) {

    if(vetor1.length != vetor2.length){
        return 'Não é possível fazer essa operação'
    }

    var vetor3 = []
    
    for (var pos = 0; pos < vetor1.length; pos++) {
        var somatoria = vetor1[pos] + vetor2[pos]

        vetor3.push(somatoria)
    }

    return vetor3
}

console.log(somaDeValores([1,2,3,4], [2,4,19,0,5]))
console.log(somaDeValores([1,2,3,4], [2,4,19,0]))