//
//  LinkedList.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/03/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation
/*
 Node:
 1.holds a refrence, holds a value
 2.nil value represents the end of the node
 Pros: Constant time insertion and removal from the front of the list.
 Cons: removal at n'th index creates time complexity of O(n), which is relatively high.
 */

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() {}
    public var isEmpty: Bool {
        return head == nil
    }
    
    /* push()
     1.head-first insertion(insert at head)
     2.TimeComplexity -> O(1) */
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /* append()
     1.tail-end insertion(insert at tail)
     2.TimeComplexity -> O(1) */
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    /* node(at:)
     1.returns a node at give index
     2.TimeComplexity -> O(i) where i is the given index*/
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index { currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    /* insert(after:)
     1.insert after a node
     2.TimeComplexity -> O(1) */
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /* pop()
     1.remove at head
     2.TimeComplexity -> O(1) */
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /* removeLast()
     1.remove at tail
     2.TimeComplexity -> O(n) */
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    /* remove(after:)
     1.remove the immediate next node
     2.TimeComplexity -> O(1) */
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
extension LinkedList: Collection {
    
    public struct Index: Comparable {
        public var node: Node<Value>?
        static public func ==(lhs: Index, rhs: Index) -> Bool { switch (lhs.node, rhs.node) {
        case let (left?, right?):
            return left.next === right.next
        case (nil, nil):
                return true
        default:
            return false
            }
        }
        static public func <(lhs: Index, rhs: Index) -> Bool {
            
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }

    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        return position.node!.value
    }
}
