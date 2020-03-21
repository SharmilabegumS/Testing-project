//
//  main.swift
//  Testing project
//
//  Created by sharmila-9182 on 20/03/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation

print("------Array Excercise------")
var objArray = ArrayExcercise()
objArray.doAction()
print("------Dictionary Excercise------")
var objDictionary = DictionaryExcercise()
objDictionary.doAction()

print("------creating and linking nodes-----")
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)
node1.next = node2
node2.next = node3
print("Before removal:" ,node1)
node2.next = nil
print("After removal:" ,node1)

print("push() result:")
var pushList = LinkedList<Int>()
pushList.push(3)
pushList.push(2)
pushList.push(1)
print(pushList)

print("append() result:")
var appendList = LinkedList<Int>()
appendList.append(1)
appendList.append(2)
appendList.append(3)
print(appendList)

print("insert(after:) result")

var insertList1 = LinkedList<Int>()
insertList1.push(3)
insertList1.push(2)
insertList1.push(1)
print("Before inserting: \(insertList1)")
var middleNode1 = insertList1.node(at: 1)!
for _ in 1...4 {
    middleNode1 = insertList1.insert(-1, after: middleNode1)
}
print("After inserting: \(insertList1)")

var insertList2 = LinkedList<Int>()
insertList2.push(7)
insertList2.push(6)
insertList2.push(1)
print("Before inserting: \(insertList2)")
var middleNode2 = insertList2.node(at: 0)!
for i in 2...5 {
    middleNode2 = insertList2.insert(i, after: middleNode2)
}
print("After inserting: \(insertList2)")

print("pop() result")
var popList = LinkedList<Int>()
popList.push(3)
popList.push(2)
popList.push(1)
print("Before popping list: \(popList)")
let poppedValue = popList.pop()
print("After popping list: \(popList)")
print("Popped value: " + String(describing: poppedValue))

print("removing the last node")
var removeLastList = LinkedList<Int>()
removeLastList.push(3)
removeLastList.push(2)
removeLastList.push(1)
print("Before removing last node: \(removeLastList)")
let removedValue = removeLastList.removeLast()
print("After removing last node: \(removeLastList)")
print("Removed value: " + String(describing: removedValue))

print("removing a node after a particular node")
var removeAtList = LinkedList<Int>()
removeAtList.push(3)
removeAtList.push(2)
removeAtList.push(1)
print("Before removing at particular index: \(removeAtList)")
let index = 1
let node = removeAtList.node(at: index - 1)!
let removedValue1 = removeAtList.remove(after: node)
print("After removing at index \(index): \(removeAtList)")
print("Removed value: " + String(describing: removedValue1))



print("using collection")
var list = LinkedList<Int>()
for i in 0...9 {
    list.append(i)
}
print("List: \(list)")
print("First element: \(list[list.startIndex])")
print("Array containing first 3 elements: \(Array(list.prefix(3)))")
print("Array containing last 3 elements: \(Array(list.suffix(3)))")
let sum = list.reduce(0, +)
print("Sum of all values: \(sum)")

