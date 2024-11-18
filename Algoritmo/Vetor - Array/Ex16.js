function returnInverseArray(numberList = []) {

    var newList =[]

    for(var pos = numberList.length -1 ; pos > -1; pos --){
        newList.push(numberList[pos])    
    }

    return newList
}

console.log(returnInverseArray([1, 2, 3, 4, 5]))
console.log(returnInverseArray([6, 7, 8, 9, 10]))
console.log(returnInverseArray([11, 12, 13, 14, 15]))