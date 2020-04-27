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

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(5)
print("Initial Stack contents: ", stack)
print("Popped out element: ", stack.pop())
stack.push(3)
print("New Stack contents: ", stack)

var queue = Queue<String>()
queue.enqueue("Ada")
queue.enqueue("Steve")
queue.enqueue("Tim")

var q = EfficientQueue<String>()
print("Empty Queue: ",q.array)                   // [] empty array

q.enqueue("Ada")
q.enqueue("Steve")
q.enqueue("Tim")
print("Queue 1: ",q.array)          // [{Some "Ada"}, {Some "Steve"}, {Some "Tim"}]
print("Queue 1 count: ",q.count)             // 3

print("Dequeued element 1: ",q.dequeue())         // "Ada"
print("List 2: ",q.array)            // [nil, {Some "Steve"}, {Some "Tim"}]
print("Queue 2 count: ", q.count)             // 2

print("Dequeued element 2: ",q.dequeue())         // "Steve"
print("List 3: ",q.array)            // [nil, nil, {Some "Tim"}]
print("Queue 3 count: ",q.count)             // 1

q.enqueue("Grace")
print("List 4: ",q.array)             // [nil, nil, {Some "Tim"}, {Some "Grace"}]
print("Queue 4 count: ",q.count)

let list1 = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print("insertionSort1 sorted number: \(insertionSort1(list1))")

let list2 = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print("insertionSort2 sorted number: \(insertionSort2(list2))")


let numbers = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
print("descendingly sorted number: \(insertionSort3(numbers, <))")
print("descendingly sorted number: \(insertionSort3(numbers, >))")

let strings = [ "b", "a", "d", "c", "e" ]
print("descendingly sorted literals: \(insertionSort3(strings, <))")


let searchNumbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

print("Position is: \(binarySearch(searchNumbers, key: 45, range: 0 ..< searchNumbers.count))")


// General Tree example
let tree = TreeNode<String>(value: "beverages")

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let chaiTeaNode = TreeNode<String>(value: "chai")

let sodaNode = TreeNode<String>(value: "soda")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let bitterLemonNode = TreeNode<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)

print(tree.description)

// BST:
print("-------- Binary Search Tree Operations ---------")
let binarySearchTree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])

print("Search for 5: \(String(describing: binarySearchTree.searchThroughLoop(5)))")
print("Search for 2: \(String(describing: binarySearchTree.searchThroughLoop(2)))")
print("Search for 7: \(String(describing: binarySearchTree.searchThroughLoop(7)))")
print("Search for 6: \(String(describing: binarySearchTree.searchThroughLoop(6)))")

print("Inorder traversal result")
binarySearchTree.traverseInOrder { value in print(value) }

print("Tree elements in array form: \(binarySearchTree.toArray())")

print("Height: \(binarySearchTree.height())")

if let node9 = binarySearchTree.searchThroughLoop(9) {
    print("Depth of 9: \(node9.depth())")  // returns 2
}

if let node1 = binarySearchTree.searchThroughLoop(1) {
    print("BST validation before wrong insertion: \(binarySearchTree.isBST(minValue: Int.min, maxValue: Int.max))") // true
    node1.insert(value: 100)                                 // EVIL!!!
    print("Missing wrongly inserted element on search: \(String(describing: binarySearchTree.searchThroughLoop(100)))")                                 // nil
    print("BST validation before wrong insertion: \(binarySearchTree.isBST(minValue: Int.min, maxValue: Int.max))")  // false
}

print("-------- Binary Search Tree enum Operations ---------")
var bstEnum = BinarySearchTreeEnum.Leaf(7)
bstEnum = bstEnum.insert(newValue: 2)
bstEnum = bstEnum.insert(newValue: 5)
bstEnum = bstEnum.insert(newValue: 10)
bstEnum = bstEnum.insert(newValue: 9)
bstEnum = bstEnum.insert(newValue: 1)

print("Search for 6: \(String(describing: bstEnum.search(x: 10)))")
print("Search for 6: \(String(describing: bstEnum.search(x: 1)))")
print("Search for 6: \(String(describing: bstEnum.search(x: 11)))")

print("Enum based BST: \(bstEnum))")

// Merge sort
print("---------- Merge sort impementations ---------")

let toPerformMergeSortArray = [2, 1, 5, 4, 9]
let mergeSortPerfromedArrayTopToBottom = mergeSort(toPerformMergeSortArray)
let mergeSortPerfromedArrayBottomUp = mergeSortBottomUp(toPerformMergeSortArray, <)
print("Merge sorted array TopToBottom: ", mergeSortPerfromedArrayTopToBottom)
print("Merge sorted array BottomUp: ", mergeSortPerfromedArrayBottomUp)



print("------ String search -------")
let sourceString = "Hello, World"
let searchPattern = "World"
print("Found at: ", sourceString.index(of: searchPattern))
print("Found at BMH: ", sourceString.indexBMH(of: searchPattern))
