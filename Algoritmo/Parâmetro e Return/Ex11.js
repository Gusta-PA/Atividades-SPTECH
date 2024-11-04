function retornarPolaridadeNumero(n1){
    if(n1 % 2 == 0 && n1 > 0){
        return 'Positivo e Par'
    }

    return 'Negativo ou Impar'
}

console.log(retornarPolaridadeNumero(-4))