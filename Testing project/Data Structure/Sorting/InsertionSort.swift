//
//  InsertionSort.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

/* Interstion sort 1:
 1. make a copy of array
 2. The outer loop looks at each of the elements in the array. From index 0 up to x - is always sorted & from index x until the last element, is the unsorted pile.
 3.  The inner loop steps backwards through the sorted array; every time it finds a previous number that is larger, it swaps them.
 */

/* Interstion sort 2:
 1. shifts up the previous elements by one position. At the end of the inner loop, y is the destination index for the new number in the sorted portion
2.  copies this number into place.
*/

/* Insertion Sort 3:
 
 */

import Foundation

func insertionSort1(_ array: [Int]) -> [Int] {
    var a = array             // 1
    for x in 1..<a.count {         // 2
        var y = x
        while y > 0 && a[y] < a[y - 1] { // 3
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

func insertionSort2(_ array: [Int]) -> [Int] {
  var a = array
  for x in 1..<a.count {
    var y = x
    let temp = a[y]
    while y > 0 && temp < a[y - 1] {
      a[y] = a[y - 1]                // 1
      y -= 1
    }
    a[y] = temp                      // 2
  }
  return a
}

func insertionSort3<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
  var a = array
  for x in 1..<a.count {
    var y = x
    let temp = a[y]
    while y > 0 && isOrderedBefore(temp, a[y - 1]) {
      a[y] = a[y - 1]                // 1
      y -= 1
    }
    a[y] = temp                      // 2
  }
  return a
}
