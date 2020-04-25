//
//  BinarySearchTree.swift
//  Testing project
//
//  Created by sharmila-9182 on 25/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

/* A binary search tree is a special kind of binary tree (a tree in which each node has at most two children) that performs insertions and deletions such that the tree is always sorted.
 */
import Foundation

/* Insertion:
 1. When performing an insertion, we first compare the new value to the root node. If the new value is smaller, we take the left branch; if greater, we take the right branch. We work our way down the tree this way until we find an empty spot where we can insert the new value.
 2. There is only one possible place where the new element can be inserted in the tree. Finding this place is usually quick. It takes O(h) time, where h is the height of the tree.
 */

/* Searching:
 1. If the value is less than the current node, then take the left branch.
 If the value is greater than the current node, take the right branch.
 If the value is equal to the current node, we've found it!
 2. Searching is fast using the structure of the tree. It runs in O(h) time. If you have a well-balanced tree with a million nodes, it only takes about 20 steps to find anything in this tree.
 */

/* Traversing:
 1.In-order (or depth-first): first look at the left child of a node then at the node itself and finally at its right child.
 2. Pre-order: first look at a node then its left and right children.
 3. Post-order: first look at the left and right children and process the node itself last.
 */

/* Deletion:
 1. Removing nodes is easy. After removing a node, we replace the node with either its biggest child on the left or its smallest child on the right. That way the tree is still sorted after the remova
 2. Note the replacement needs to happen when the node has at least one child. If it has no child, you just disconnect it from its parent
 */

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
    // Insertion
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    // Searching
    
    public func searchRecursively(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.searchRecursively(value: value)
        } else if value > self.value {
            return right?.searchRecursively(value: value)
        } else {
            return self  // found it!
        }
    }
    
    public func searchThroughLoop(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    // Traversal
    
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }
    
    // Deletion
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // Replacement for current node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        // Place the replacement on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node:replacement)
        
        // The current node is no longer part of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    // Depth and height
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    // predecessor and successcor
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = left {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }
    
    public func successor() -> BinarySearchTree<T>? {
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }
    
    // valid BST
    public func isBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue { return false }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}
