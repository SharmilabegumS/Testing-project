//
//  QueueExcercise.swift
//  Testing project
//
//  Created by sharmila-9182 on 09/04/20.
//  Copyright © 2020 sharmila-9182. All rights reserved.
//

import Foundation
/*
 1. A queue is a list where you can only insert new items at the back and remove items from the front.
 First come, first serve!
 2. A queue gives you a FIFO or first-in, first-out order
 3. A queue is not always the best choice. If the order in which the items are added and removed from the list is not important, you can use a stack instead of a queue. Stacks are simpler and faster.
 */
public struct Queue<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}


// A more efficient queue

public struct EfficientQueue<T> {
  var array = [T?]()
  fileprivate var head = 0
  
  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}
