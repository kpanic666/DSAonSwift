//
//  main.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 12.10.2021.
//

import Foundation

var list = SinglyLinkedList()
list.append(7)
list.append(8)
list.append(9999999999)
print(list)

list.addAtIndex(0, value: 6)
list.addFirst(-1)
print(list)

list.removeAtIndex(2)
print(list.indexOf(8))
print(list.indexOf(10))
print(list)
list.clear()
print(list)
list.append(7)
list.append(8)
list.append(9999999999)
list.removeLast()
list.removeFirst()
print(list)
