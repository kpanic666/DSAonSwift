//
//  ArrayQueue.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 10.11.2021.
//

import Foundation

struct ArrayQueue<T>: DSArrayBased {
    var arr: Array<T>
    
    init() {
        arr = []
    }
    
    init(from elements: [Item]) {
        self.arr = elements
    }
    
    mutating func enque(_ element: T) {
        arr.append(element)
    }
    
    mutating func deque() throws -> T {
        if !isEmpty {
            return arr.removeFirst()
        } else {
            throw DSArrayError.emptyArray
        }
    }
    
    func peek() throws -> T {
        if !isEmpty {
            return arr[0]
        } else {
            throw DSArrayError.emptyArray
        }
    }
}
