function retornarMultiplo(n1,n2){
    if(n1 % n2 == 0){
        return 'é multiplo'
    }

    return 'não é multiplo'
}

console.log(retornarMultiplo(4,2))
console.log(retornarMultiplo(8,2))
console.log(retornarMultiplo(9,3))
console.log(retornarMultiplo(10,3))