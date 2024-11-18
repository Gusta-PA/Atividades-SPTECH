function returnUniques(numberList = []) {
    var listUniques = []

    for (var pos = 0; pos < numberList.length; pos++) {
        var numberInList = false

        for (var i = 0; i < listUniques.length; i++) {
            if (numberList[pos] == listUniques[i]) {
                numberInList = true
            }
        }

        if (!numberInList) {
            listUniques.push(numberList[pos])
        }
    }
    return listUniques
}


console.log(returnUniques([1, 2, 3, 4, 5, 1, 3, 5]))
console.log(returnUniques([1, 1, 1, 1, 1, 1, 1, 1, 1]))
console.log(returnUniques([1, 1, 1, 1, 1, 2, 3]))