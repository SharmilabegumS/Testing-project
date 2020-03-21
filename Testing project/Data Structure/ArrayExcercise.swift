//
//  ArrayExcercise.swift
//  Testing project
//
//  Created by sharmila-9182 on 19/03/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation

/*
 Pros:
 1. Order is maintained
 2. Constant access time O(1)
 
 Cons:
 1. Inserting at the middle / front of the array needs shifting of remaining element after the insertion index. Inserting to the front is the worst case
 2. Lookup time for particular element is O(n)
*/


class ArrayExcercise {
    var array = ["test0", "test1", "test3"]
    func doAction(){
        array.append("test4")
        array.insert("test2", at: 2)
        array.remove(at: 0)
        for element in array {
            print("Respective element is: \(element)")
        }
    }
}


