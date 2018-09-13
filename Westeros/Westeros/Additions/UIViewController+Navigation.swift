//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by Alexandre Freire on 12/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
