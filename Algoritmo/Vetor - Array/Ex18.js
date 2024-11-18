function verifyDuplicates(numberList = []) {

    for (var pos = 0; pos < numberList.length; pos++) {

        for (var i = pos + 1; i < numberList.length; i++) {
            if (numberList[pos] == numberList[i]) {
                return true
            }
        }
    }
    return false
}

console.log(verifyDuplicates([1, 2, 3, 4, 5]))
console.log(verifyDuplicates([3, 1, 2, 3, 3, 4, 4, 5, 5]))
console.log(verifyDuplicates([1, 1, 1, 2]))
console.log(verifyDuplicates([10, 11, 12, 13, 15]))