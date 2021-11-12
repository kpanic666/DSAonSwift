//
//  SinglyLinkedList.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 12.11.2021.
//

import Foundation

struct SinglyLinkedList<T: Equatable> {
    private(set) var count = 0
    private var head: Node
    private var tail: Node
    
    var isEmpty: Bool {
        count == 0
    }
    
    class Node {
        var next: Node?
        var value: T?
        
        init() {
        }
        
        init(next: Node?, value: T) {
            self.next = next
            self.value = value
        }
    }
    
    init() {
        head = Node()
        tail = head
    }
    
    private mutating func addLast(_ elem: T) {
        if isEmpty {
            head = Node(next: nil, value: elem)
            tail = head
        } else {
            tail.next = Node(next: nil, value: elem)
            tail = tail.next!
        }
        
        count += 1
    }
    
    mutating func append(_ elem: T) {
        addLast(elem)
    }
    
    mutating func addFirst(_ elem: T) {
        if isEmpty {
            head = Node(next: nil, value: elem)
            tail = head
        } else {
            head = Node(next: head, value: elem)
        }
        count += 1
    }
    
    mutating func addAtIndex(_ index: Int, value elem: T) {
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
        
        let newNode = Node(next: unwrappedTrav.next, value: elem)
        unwrappedTrav.next = newNode
        
        count += 1
    }
    
    mutating func removeLast() {
        // complexity is O(n) because to delete any element (q-element) except the first we need to traverse to
        // q-1 element to nil the "next" pointer
        guard !isEmpty else { return }
        
        var trav: Node? = head
        
        if count == 1 {
            trav?.value = nil
        } else {
            for _ in 1 ..< (count - 1) {
                trav = trav?.next
            }
            
            if let trav = trav {
                trav.next = nil
                tail = trav
            }
        }

        count -= 1
    }
    
    mutating func removeFirst() {
        guard !isEmpty else { return }
        
        if let nextHead = head.next {
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
        var prev: Node?
        
        for _ in 0 ..< index {
            prev = trav
            trav = trav?.next
        }
        
        guard let trav = trav, let prev = prev else { return }
        
        prev.next = trav.next
        count -= 1
    }
    
    func indexOf(_ elem: T) -> Int? {
        var trav: Node = head
        
        guard count > 0 else { return nil }
        
        for i in 0 ..< count {
            if trav.value == elem {
                return i
            }
            
            if let utrav = trav.next {
                trav = utrav
            }
        }
        
        return nil
    }
    
    mutating func clear() {
        guard !isEmpty else { return }
        
        head.value = nil
        tail = head
        count = 0
        
        var trav: Node? = head
        var travNext: Node?
        
        while trav != nil {
            travNext = trav?.next
            trav?.next = nil
            trav = travNext
        }
    }
}

extension SinglyLinkedList: CustomStringConvertible {
    var description: String {
        var trav: Node? = head
        var values = [T]()
        
        while trav != nil {
            if let value = trav?.value {
                values.append(value)
            }
            trav = trav!.next
        }
        
        return String(describing: values)
    }
}

