//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Aitor Garcia on 25/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {

    var firstSeason: Season!
    var firstEpisode: Episode!
    var secondEpisode: Episode!
    
    override func setUp() {
        firstSeason = Season(name: "First Season", releaseDate: Date(dateString:"17/04/2011")!)
        
        firstEpisode = Episode(title: "Winter Is Coming", issueDate: Date(dateString:"17/04/2011")!, season: firstSeason)
        secondEpisode = Episode(title: "The Kingsroad", issueDate: Date(dateString:"24/04/2011")!, season: firstSeason)
    }
    
    override func tearDown() {
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(firstEpisode)
        XCTAssertNotNil(secondEpisode)
    }
    
    func testEpisodeDescription() {
        XCTAssertEqual(firstEpisode.description, "First Season: Winter Is Coming")
        XCTAssertEqual(secondEpisode.description, "First Season: The Kingsroad")
    }
    
    func testEpisodeName() {
        XCTAssertEqual(firstEpisode.title, "Winter Is Coming")
        XCTAssertEqual(secondEpisode.title, "The Kingsroad")
    }
    
    func testEpisodeEquality() {
        // 1. Identidad
        XCTAssertEqual(firstEpisode, firstEpisode)
        
        // 2. Igualdad
        let startEpisode = Episode(title: "Winter Is Coming", issueDate: Date(dateString:"17/04/2011")!, season: firstSeason)
        XCTAssertEqual(firstEpisode, startEpisode)
        
        // 3. Desigualdad
        XCTAssertNotEqual(firstEpisode, secondEpisode)
    }
    
    func testEpisodeComparison() {
        XCTAssertGreaterThan(firstEpisode, secondEpisode)
    }

}
