//
//  BinarySearchTree_Enum.swift
//  Testing project
//
//  Created by sharmila-9182 on 25/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation

/* The difference is reference semantics versus value semantics. Making a change to the class-based tree will update that same instance in memory, but the enum-based tree is immutable -- any insertions or deletions will give you an entirely new copy of the tree. Which one is best, totally depends on what you want to use it for.
 */
public enum BinarySearchTreeEnum<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(BinarySearchTreeEnum, T, BinarySearchTreeEnum)
    
    public var count: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty: return -1
        case .Leaf: return 0
        case let .Node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    public func insert(newValue: T) -> BinarySearchTreeEnum {
        switch self {
        case .Empty:
            return .Leaf(newValue)
            
        case .Leaf(let value):
            if newValue < value {
                return .Node(.Leaf(newValue), value, .Empty)
            } else {
                return .Node(.Empty, value, .Leaf(newValue))
            }
            
        case .Node(let left, let value, let right):
            if newValue < value {
                return .Node(left.insert(newValue: newValue), value, right)
            } else {
                return .Node(left, value, right.insert(newValue: newValue))
            }
        }
    }
    public func search(x: T) -> BinarySearchTreeEnum? {
        switch self {
        case .Empty:
            return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case let .Node(left, y, right):
            if x < y {
                return left.search(x: x)
            } else if y < x {
                return right.search(x: x)
            } else {
                return self
            }
        }
    }
}
extension BinarySearchTreeEnum: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty: return "."
        case .Leaf(let value): return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}
