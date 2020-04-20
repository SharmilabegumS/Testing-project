//
//  LinearSearch.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation

func linearSearch<T: Equatable>(_ a: [T], _ key: T) -> Int? {
    for i in 0 ..< a.count {
        if a[i] == key {
            return i
        }
    }
    return nil
}
