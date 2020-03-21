//
//  Node.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/03/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?
    public init(value: Value, next: Node? = nil) { self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
