//
//  Character.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final class Person {
    
    // Mark: - Properties
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get{
//            if let alias = _alias {
//                // Existe y esta guardado dentro de _alias
//                return alias
//            } else {
//                return ""
//            }
            return _alias ?? "" // Devuelveme _alias, si hay algo, y si no, ""
        }
    }
    
    // Mark: - Initialization
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        self._alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy: String {
        return "\(name)\(alias)\(house.name)"
    }
}

extension Person: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}
