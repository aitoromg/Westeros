//
//  Sigil.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}
