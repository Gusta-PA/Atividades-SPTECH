function verDivisivelPorTres(n1){
    if(n1 % 3 == 0){
        return 'divisível por 3'
    } else {
        return 'não divisível por 3'
    }
}

// > resultado = verDivisivelPorTres(3)
// 'divisível por 3'

// > resultado = verDivisivelPorTres(4)
// 'não divisível por 3'

// > resultado = verDivisivelPorTres(5)
// 'não divisível por 3'

// > resultado = verDivisivelPorTres(6)
// 'divisível por 3'