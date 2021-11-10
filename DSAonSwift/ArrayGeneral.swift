//
//  ArrayGeneral.swift
//  DSAonSwift
//
//  Created by Andrei Korikov on 10.11.2021.
//

enum DSArrayError: Error {
    case emptyArray
}

protocol DSArrayBased: CustomStringConvertible {
    associatedtype Item
    
    var arr: [Item] { get set }
    var count: Int { get }
    var isEmpty: Bool { get }
}

extension DSArrayBased {
    var description: String {
        String(describing: arr)
    }
    
    var count: Int {
        arr.count
    }
    
    var isEmpty: Bool {
        arr.isEmpty
    }
}
