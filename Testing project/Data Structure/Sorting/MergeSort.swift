//
//  MergeSort.swift
//  Testing project
//
//  Created by sharmila-9182 on 25/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation
/*
 1. Invented in 1945 by John von Neumann, merge-sort is an efficient algorithm with a best, worst, and average time complexity of O(n log n).
 2. The merge-sort algorithm uses the divide and conquer approach which is to divide a big problem into smaller problems and solve them.
 
 Working:
 1. Put the numbers in an unsorted pile.
 2. Split the pile into two. Now, you have two unsorted piles of numbers.
 3. Keep splitting the resulting piles until you cannot split anymore. In the end, you will have n piles with one number in each pile.
 4. Begin to merge the piles together by pairing them sequentially. During each merge, put the contents in sorted order. This is fairly easy because each individual pile is already sorted.
 */

// Top down implementation:

/* A step-by-step explanation:
 
 1. If the array is empty or contains a single element, there is no way to split it into smaller pieces. You must just return the array.
 
 2. Find the middle index.
 
 3. Using the middle index from the previous step, recursively split the left side of the array.
 
 4. Also, recursively split the right side of the array.
 
 5. Finally, merge all the values together, making sure that it is always sorted.
 
 */

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }    // 1
    
    let middleIndex = array.count / 2              // 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))             // 3
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // 4
    
    return merge(leftPile: leftArray, rightPile: rightArray)             // 5
}

/*
 1. You need two indexes to keep track of your progress for the two arrays while merging.
 
 2. This is the merged array. It is empty right now, but you will build it up in subsequent steps by appending elements from the other arrays. Since you already know number of elements that will end up in this array, you reserve capacity to avoid reallocation overhead later.
 
 3. This while-loop will compare the elements from the left and right sides and append them into the orderedPile while making sure that the result stays in order.
 
 4. If control exits from the previous while-loop, it means that either the leftPile or the rightPile has its contents completely merged into the orderedPile. At this point, you no longer need to do comparisons. Just append the rest of the contents of the other array until there is no more to append.
 */


func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    // 1
    var leftIndex = 0
    var rightIndex = 0
    
    // 2
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count)
    
    // 3
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    // 4
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}


/*
 Notable points:
 
 1. The Merge-sort algorithm needs a temporary working array because you cannot merge the left and right piles and at the same time overwrite their contents. Because allocating a new array for each merge is wasteful, we are using two working arrays, and we will switch between them using the value of d, which is either 0 or 1. The array z[d] is used for reading, and z[1 - d] is used for writing. This is called double-buffering.
 
 2. Conceptually, the bottom-up version works the same way as the top-down version. First, it merges small piles of one element each, then it merges piles of two elements each, then piles of four elements each, and so on. The size of the pile is given by width. Initially, width is 1 but at the end of each loop iteration, we multiply it by two, so this outer loop determines the size of the piles being merged, and the subarrays to merge become larger in each step.
 
 3. The inner loop steps through the piles and merges each pair of piles into a larger one. The result is written in the array given by z[1 - d].
 
 4. This is the same logic as in the top-down version. The main difference is that we're using double-buffering, so values are read from z[d] and written into z[1 - d]. It also uses an isOrderedBefore function to compare the elements rather than just <, so this merge-sort algorithm is generic, and you can use it to sort any kind of object you want.
 
 5. At this point, the piles of size width from array z[d] have been merged into larger piles of size width * 2 in array z[1 - d]. Here, we swap the active array, so that in the next step we'll read from the new piles we have just created.
 */

func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    
    var z = [a, a]      // 1
    var d = 0
    
    var width = 1
    while width < n {   // 2
        
        var i = 0
        while i < n {     // 3
            
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {                // 4
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
        }
        
        width *= 2
        d = 1 - d      // 5
    }
    return z[d]
}

