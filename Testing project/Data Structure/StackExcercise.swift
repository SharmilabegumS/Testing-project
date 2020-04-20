//
//  StackExcercise.swift
//  Testing project
//
//  Created by sharmila-9182 on 09/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

/*
 Stack is like an array with limited functionality
 1. push to add a new element to the top of the stack
 2. pop to remove the element from the top
 3. peek at the top element without popping it off.
 4. It follows LIFO or last-in first-out order
 
*/
import Foundation

public struct Stack<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var top: T? {
    return array.last
  }
}
