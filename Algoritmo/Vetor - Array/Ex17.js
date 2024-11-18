function returnAmountNegatives(numberList = []) {
    var qtdNegatives = 0

    for (var pos = 0; pos < numberList.length; pos++) {
        if (numberList[pos] < 0) {
            qtdNegatives++
        }
    }
    return qtdNegatives
}

console.log(returnAmountNegatives([1, 2, 3, 4, 5]))
console.log(returnAmountNegatives([1, -2, 3, -4, 5]))
console.log(returnAmountNegatives([-1, -2, -3, -4, -5]))