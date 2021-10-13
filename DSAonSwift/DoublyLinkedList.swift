//
//  DoublyLinkedList.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 12.10.2021.
//

import Foundation

struct DoublyLinkedList {
    private(set) var count = 0
    private var head: Node
    private var tail: Node
    
    var isEmpty: Bool {
        count == 0
    }
    
    class Node {
        var prev: Node?
        var next: Node?
        var value: Int?
        
        init() {
        }
        
        init(prev: Node?, next: Node?, value: Int) {
            self.prev = prev
            self.next = next
            self.value = value
        }
    }
    
    init() {
        head = Node()
        tail = head
    }
    
    private mutating func addLast(_ elem: Int) {
        if isEmpty {
            head = Node(prev: nil, next: nil, value: elem)
            tail = head
        } else {
            tail.next = Node(prev: tail, next: nil, value: elem)
            tail = tail.next!
        }
        
        count += 1
    }
    
    mutating func append(_ elem: Int) {
        addLast(elem)
    }
    
    mutating func addFirst(_ elem: Int) {
        if isEmpty {
            head = Node(prev: nil, next: nil, value: elem)
            tail = head
        } else {
            head.prev = Node(prev: nil, next: head, value: elem)
            head = head.prev!
        }
        count += 1
    }
    
    mutating func addAtIndex(_ index: Int, value elem: Int) {
        guard index >= 0 && index <= count else { return }
        
        if index == 0 {
            addFirst(elem)
            return
        }
        
        if index == count {
            append(elem)
            return
        }
        
        var trav: Node? = head
        
        for _ in 0 ..< (index - 1) {
            trav = trav?.next
        }
        
        guard let unwrappedTrav = trav else { return }
        
        let newNode = Node(prev: unwrappedTrav, next: unwrappedTrav.next, value: elem)
        unwrappedTrav.next = newNode
        newNode.next?.prev = newNode
        
        count += 1
    }
    
    mutating func removeLast() {
        guard !isEmpty else { return }
        
        if let prevTail = tail.prev {
            prevTail.next = nil
            tail = prevTail
        } else {
            tail.value = nil
        }

        count -= 1
    }
    
    mutating func removeFirst() {
        guard !isEmpty else { return }
        
        if let nextHead = head.next {
            nextHead.prev = nil
            head = nextHead
        } else {
            head.value = nil
        }
        
        count -= 1
    }
    
    mutating func removeAtIndex(_ index: Int) {
        guard index >= 0 && index < count else { return }
        
        if index == 0 {
            removeFirst()
            return
        }
        
        if index == count - 1 {
            removeLast()
            return
        }
        
        var trav: Node? = head
        
        for _ in 0 ..< index {
            trav = trav?.next
        }
        
        guard let unwrappedTrav = trav else { return }
        
        unwrappedTrav.prev?.next = unwrappedTrav.next
        unwrappedTrav.next?.prev = unwrappedTrav.prev
        
        count -= 1
    }
    
    func indexOf(_ elem: Int?) -> Int? {
        var result: Int?
        var trav: Node = head
        
        guard count > 0 else { return result }
        
        for i in 0 ..< count {
            if trav.value == elem {
                result = i
                break
            }
            
            if let utrav = trav.next {
                trav = utrav
            }
        }
        
        return result
    }
    
    mutating func clear() {
        guard !isEmpty else { return }
        
        var trav: Node? = tail
        
        while trav != nil {
            trav?.next = nil
            trav = trav?.prev
        }
        
        tail = head
        head.next = nil
        head.value = nil
        count = 0
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        var trav: Node? = head
        var values = [Int]()
        
        while trav != nil {
            if let value = trav?.value {
                values.append(value)
            }
            trav = trav!.next
        }
        
        return String(describing: values)
    }
}
