//
//  main.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 12.10.2021.
//

import Foundation

var linkedList = DoublyLinkedList()
linkedList.append(8)
linkedList.append(200404)
linkedList.addFirst(55)
linkedList.addFirst(6)
linkedList.append(0)
print(linkedList)
linkedList.addAtIndex(1, value: 655)
print(linkedList)
linkedList.addAtIndex(4, value: 2004040)
linkedList.addAtIndex(-1, value: 2004040)
linkedList.addAtIndex(88, value: 2004040)
print(linkedList)
linkedList.removeLast()
linkedList.append(11)
linkedList.removeFirst()
linkedList.removeFirst()
linkedList.removeLast()
print(linkedList)
print(linkedList.indexOf(8))
print(linkedList.indexOf(200404))
print(linkedList.indexOf(nil))
print(linkedList.indexOf(435))
print(linkedList)
linkedList.removeAtIndex(2)
linkedList.removeAtIndex(1)
print(linkedList)
linkedList.clear()
print(linkedList)
