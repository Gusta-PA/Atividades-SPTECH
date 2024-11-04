function retornarSomaPares(n1){
    var somaPares = 0
    
    for(var numero = 1; numero <= n1; numero++){
        if(numero % 2 == 0){
            somaPares += numero
        }
    }
    return somaPares
}


console.log(retornarSomaPares(8)) // 20
console.log(retornarSomaPares(10)) // 30
console.log(retornarSomaPares(3)) // 2