//
//  main.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 12.10.2021.
//

import Foundation

var queue = ArrayQueue<Int?>()
queue.enque(5)
queue.enque(nil)
queue.enque(10)
queue.enque(15)
print(queue)

//print(queue.isEmpty)
//print(queue.count)
//
//do {
//    try queue.deque()
//    print("deque - \(try queue.deque())")
//
//    print(queue)
//    try queue.deque()
//    try queue.deque()
//} catch DSArrayError.emptyArray {
//    print("Trying to deque empty queue.")
//}
//
//print(queue)
//queue.count = 5
//print(queue.count)
//queue.isEmpty = false
//print(queue.isEmpty)
