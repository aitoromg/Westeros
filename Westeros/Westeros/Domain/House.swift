//
//  House.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Words = String

final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
    }
}
