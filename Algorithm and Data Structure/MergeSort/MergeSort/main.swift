//
//  main.swift
//  MergeSort
//
//  Created by Yash Jivani on 09/03/21.
//

import Foundation

func mergeSortRecursive<T: Comparable>(_ array: [T]) -> [T]{
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSortRecursive(Array(array[0..<middleIndex]))
    let rightArray = mergeSortRecursive(Array(array[middleIndex..<array.count]))
    return mergeRecursive(leftArray: leftArray, rightArray: rightArray)
}

func mergeRecursive<T: Comparable>(leftArray: [T], rightArray: [T]) -> [T]{
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [T] = []
    
    if orderedArray.capacity < leftArray.count + rightArray.count{
        orderedArray.reserveCapacity(leftArray.count + rightArray.count)
    }
    
    while true{
        guard leftIndex < leftArray.endIndex else{
            orderedArray.append(contentsOf: rightArray[rightIndex..<rightArray.endIndex])
            break
        }
        
        guard  rightIndex < rightArray.endIndex else {
            orderedArray.append(contentsOf: leftArray[leftIndex..<leftArray.endIndex])
            break
        }
        
        if leftArray[leftIndex] < rightArray[rightIndex]{
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }else{
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    return orderedArray
}


func mergeSortIterative<T: Comparable>(_ array: inout [T], _ isOrderedBefore: (T, T) -> Bool){
    let size = array.count
    var currentSize = 1
    while currentSize <= array.count - 1{
        var leftStart = 0
        while leftStart < array.count - 1{
            let mid = min(leftStart + currentSize - 1, size - 1)
            let rightEnd = min(leftStart + 2*currentSize - 1, size - 1)
           
            mergeIterative(&array, leftStart: leftStart, mid: mid, rightEnd: rightEnd)
            //print(leftStart)
            leftStart += 2 * currentSize
            
        }
        currentSize = 2 * currentSize
    }
    
}

func mergeIterative<T: Comparable>(_ array: inout [T], leftStart: Int, mid: Int, rightEnd: Int){
    
    var i = 0
    var j = 0
    var k = leftStart
    let n1 = mid - leftStart + 1
    let n2 = rightEnd - mid
    var leftArray : [T] = []
    var rightArray : [T] = []
    
    for i in 0..<n1{
        //print(array[i])
        leftArray.append(array[leftStart + i])
    }
    
    for j in 0..<n2{
        rightArray.append(array[mid + j + 1])
        
    }
    
    while(i < n1 && j < n2){
        // if isOrderedBefore(array[i], array[j]){
        
        if (leftArray[i] <= rightArray[j]){
            array[k] = leftArray[i]
            i += 1
        }else{
            array[k] = rightArray[j]
            j += 1
        }
        k += 1
    }
    
    while (i < n1) {
        array[k] = leftArray[i]
        i += 1
        k += 1
    }
    
    while (j < n2){
        array[k] = rightArray[j]
        j += 1
        k += 1
    }
    
}




var temp = [12, 11, 13, 5, 6, 7]
mergeSortIterative(&temp, <)
print(temp)


