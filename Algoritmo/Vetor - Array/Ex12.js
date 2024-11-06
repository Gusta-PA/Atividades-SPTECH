function verOrdemCrescente(vetor) {
    for (var pos = 0; pos < vetor.length; pos++) {
        Number(vetor[pos])

        if (isNaN(vetor[pos])) {
            return 'Lista Inválida'
        }

        if (vetor[pos] > vetor[pos + 1]) {
            return false
        }
    }
    return true
}


console.log(verOrdemCrescente([1, 2, 3, 8, 7, 6])) // false
console.log(verOrdemCrescente([1, 2, 3, 4, 5])) // true 
console.log(verOrdemCrescente([1, 2, 3, '4', '5', 6])) // true
console.log(verOrdemCrescente([1, '4', 2, 3, '5', 6])) // false
console.log(verOrdemCrescente([1, 2, 3, 'quatro', 5])) // Lista Inválida