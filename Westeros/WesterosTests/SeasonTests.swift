//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Aitor Garcia on 25/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {

    var firstSeason: Season!
    var secondSeason: Season!
    var firstEpisodeOfFirstSeason: Episode!
    var firstEpisodeOfSecondSeason: Episode!
    
    override func setUp() {
        firstSeason = Season(name: "First Season", releaseDate: Date(dateString:"17/04/2011")!)
        secondSeason = Season(name: "Second Season", releaseDate: Date(dateString:"01/04/2012")!)
        
        firstEpisodeOfFirstSeason = Episode(title: "First Episode Of First Season", issueDate: Date(), season: firstSeason)
        firstEpisodeOfSecondSeason = Episode(title: "First Episode Of Second Season", issueDate: Date(), season: secondSeason)
    }
    
    override func tearDown() {
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
        XCTAssertNotNil(secondSeason)
    }
    
    func testSeasonDescription() {
        XCTAssertEqual(firstSeason.description, "Description of First Season")
        XCTAssertEqual(secondSeason.description, "Description of Second Season")
    }
    
    func testSeasonName() {
        XCTAssertEqual(firstSeason.name, "First Season")
        XCTAssertEqual(secondSeason.name, "Second Season")
    }
    
    func testSeasonEquality() {
        // 1. Identidad
        XCTAssertEqual(firstSeason, firstSeason)
        
        // 2. Igualdad
        let startSeason = Season(name: "First Season", releaseDate: Date(dateString:"17/04/2011")!)
        XCTAssertEqual(firstSeason, startSeason)
        
        // 3. Desigualdad
        XCTAssertNotEqual(firstSeason, secondSeason)
    }
    
    func testSeasonComparison() {
        XCTAssertLessThan(firstSeason, secondSeason)
    }

}
