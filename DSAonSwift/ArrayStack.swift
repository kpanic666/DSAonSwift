//
//  ArrayStack.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 18.10.2021.
//

import Foundation

struct ArrayStack<Element> {
    private var arr: [Element]
    var count: Int {
        arr.count
    }
    var isEmpty: Bool {
        arr.isEmpty
    }
    
    init() {
        arr = []
    }
    
    init(first element: Element) {
        arr = [element]
    }
    
    init(_ s: [Element]) {
        arr = s
    }
    
    mutating func push(_ elem: Element) {
        arr.append(elem)
    }
    
    mutating func pop() -> Element? {
        arr.popLast()
    }
    
    func peek() -> Element? {
        arr.last
    }
}

extension ArrayStack: CustomStringConvertible {
    var description: String {
        String(describing: arr)
    }
}
