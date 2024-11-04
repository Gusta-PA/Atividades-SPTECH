function retornarMaior(n1, n2, n3) {

    if (n1 < n2 && n2 < n3) {
        return n3
    }

    if (n1 < n2 && n3 < n2) {
        return n2;
    }

    return n1
}

console.log(retornarMaior(1,2,3))
console.log(retornarMaior(4,3,1))
console.log(retornarMaior(3,9,1))
console.log(retornarMaior(0,0,0))