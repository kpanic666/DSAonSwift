//
//  ArrayStack.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 18.10.2021.
//

import Foundation

struct ArrayStack<Element>: DSArrayBased {
    var arr: [Element]
    
    init() {
        arr = []
    }
    
    init(first element: Element) {
        arr = [element]
    }
    
    init(from elements: [Item]) {
        self.arr = elements
    }
    
    mutating func push(_ elem: Element) {
        arr.append(elem)
    }
    
    mutating func pop() throws -> Element? {
        if !isEmpty {
            return arr.popLast()
        } else {
            throw DSArrayError.emptyArray
        }
    }
    
    func peek() throws -> Element? {
        if !isEmpty {
            return arr.last
        } else {
            throw DSArrayError.emptyArray
        }
    }
}
