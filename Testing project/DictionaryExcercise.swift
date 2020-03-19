//
//  DictionaryExcercise.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/03/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation
/*
 Pros:
 1. Lookup operations are done in O(1)
 2. Inserting into a dictionary is always O(1).
 1. Order is maintained
 2. Constant access time O(1)
 
 Cons:
 1. Order is not maintained
 2.
 1. Inserting at the middle / front of the array needs shifting of remaining element after the insertion index. Inserting to the front is the worst case
*/


class DictionaryExcercise {
    var dictionary = ["person1": 10, "person2": 20, "person3" : 30]
    func doAction() {
        print("Looked up for this particular person mark: ", dictionary["person1"] ?? "Not found")
        dictionary["person3"] = 35
        print(dictionary)
        print("Collection is not changed, Order remains same")
        print(dictionary)
        dictionary.updateValue(40, forKey: "person4")
        dictionary.removeValue(forKey: "person1")
        print("Collection is muted, Order changed")
        print(dictionary)
        for (key, value) in dictionary {
            print("Name: \(key) , Score -> \(value)")
        }
    }
}


