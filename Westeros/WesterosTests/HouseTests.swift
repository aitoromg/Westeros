//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 06/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        
        let stark = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "Leon rampante")
        XCTAssertNotNil(lannisterSigil)

    }
}
