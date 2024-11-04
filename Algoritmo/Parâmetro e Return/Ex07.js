function contarVogais(palavra){
    var stringPalavra = palavra
    var vogaisTotais = 0

    for(var pos = 0;pos <= stringPalavra.length; pos++){
        if(
            palavra[pos] == 'a' || 
            palavra[pos] == 'e' || 
            palavra[pos] == 'i' || 
            palavra[pos] == 'o' ||
            palavra[pos] == 'u'
        ){
            vogaisTotais++
        }
    }

    return vogaisTotais
}

// > contarVogais('Caio')
// 3

// > contarVogais('muito')
// 3

// > contarVogais('lindo s2')
// 2