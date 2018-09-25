//
//  Respository.swift
//  Westeros
//
//  Created by Alexandre Freire on 12/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit


final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias Filter = (House) -> Bool
    
    var houses: [House] { get }
    
    func house(named: String) -> House?
    
    func houses(filteredBy filter: Filter) -> [House]
}

protocol SeasonFactory {
    typealias FilterSeason = (Season) -> Bool
    
    var seasons: [Season] { get }
    
    func season(named: String) -> Season?
    
    func seasons(filteredBy filter: FilterSeason) -> [Season]
}

final class LocalFactory: HouseFactory, SeasonFactory {
    
    var houses: [House] {
    
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "Leon Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragon tricefalo")

        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkUrl)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterUrl)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenUrl)
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(persons: arya, robb)
        lannisterHouse.add(persons: tyrion, jaime, cersei)
        targaryenHouse.add(person: dani)
        
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
//        return houses.filter { $0.name.uppercased() == name.uppercased() }.first
        return houses.first { $0.name.uppercased() == name.uppercased() } 
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return houses.filter(filteredBy)
    }
    
    var seasons: [Season] {
        
        // Seasons creation here
        let firstSeason = Season(name: "First Season", releaseDate: Date(dateString:"17/04/2011")!)
        let secondSeason = Season(name: "Second Season", releaseDate: Date(dateString:"01/04/2012")!)
        let thirdSeason = Season(name: "Third Season", releaseDate: Date(dateString:"31/03/2013")!)
        let fourthSeason = Season(name: "Fourth Season", releaseDate: Date(dateString:"6/04/2014")!)
        let fifthSeason = Season(name: "Fifth Season", releaseDate: Date(dateString:"12/04/2015")!)
        let sixthSeason = Season(name: "Sixth Season", releaseDate: Date(dateString:"24/04/2016")!)
        let seventhSeason = Season(name: "Seventh Season", releaseDate: Date(dateString:"16/07/2017")!)
        
        // Episodes creation
        let firstEpisodeOfFirstSeason = Episode(title: "Winter Is Coming ", issueDate: Date(dateString:"17/04/2011"), season: firstSeason)
        let secondEpisodeOfFirstSeason = Episode(title: "The Kingsroad ", issueDate: Date(dateString:"24/04/2011"), season: firstSeason)
        let firstEpisodeOfSecondSeason = Episode(title: "The North Remembers", issueDate: Date(dateString:"01/04/2012"), season: secondSeason)
        let secondEpisodeOfSecondSeason = Episode(title: "The Night Lands", issueDate: Date(dateString:"08/04/2012"), season: secondSeason)
        let firstEpisodeOfThirdSeason = Episode(title: "Valar Dohaeris", issueDate: Date(dateString:"31/03/2013"), season: thirdSeason)
        let secondEpisodeOfThirdSeason = Episode(title: "Dark Wings, Dark Words ", issueDate: Date(dateString:"07/04/2013"), season: thirdSeason)
        let firstEpisodeOfFourthSeason = Episode(title: "Two Swords", issueDate: Date(dateString:"06/04/2014"), season: fourthSeason)
        let secondEpisodeOfFourthSeason = Episode(title: "The Lion and the Rose", issueDate: Date(dateString:"13/04/2014"), season: fourthSeason)
        let firstEpisodeOfFifthSeason = Episode(title: "The Wars to Come", issueDate: Date(dateString:"12/04/2015"), season: fifthSeason)
        let secondEpisodeOfFifthSeason = Episode(title: "The House of Black and White", issueDate: Date(dateString:"19/04/2015"), season: fifthSeason)
        let firstEpisodeOfSixthSeason = Episode(title: "The Red Woman", issueDate: Date(dateString:"24/04/2016"), season: sixthSeason)
        let secondEpisodeOfSixthSeason = Episode(title: "Home", issueDate: Date(dateString:"01/05/2016"), season: sixthSeason)
        let firstEpisodeOfSeventhSeason = Episode(title: "Dragonstone ", issueDate: Date(dateString:"16/07/2017"), season: seventhSeason)
        let secondEpisodeOfSeventhSeason = Episode(title: "Stormborn ", issueDate: Date(dateString:"23/07/2017"), season: seventhSeason)
        
        // Add episodes to seasons
        firstSeason.add(episodes: firstEpisodeOfFirstSeason, secondEpisodeOfFirstSeason)
        secondSeason.add(episodes: firstEpisodeOfSecondSeason, secondEpisodeOfSecondSeason)
        thirdSeason.add(episodes: firstEpisodeOfThirdSeason, secondEpisodeOfThirdSeason)
        fourthSeason.add(episodes: firstEpisodeOfFourthSeason, secondEpisodeOfFourthSeason)
        fifthSeason.add(episodes: firstEpisodeOfFifthSeason, secondEpisodeOfFifthSeason)
        sixthSeason.add(episodes: firstEpisodeOfSixthSeason, secondEpisodeOfSixthSeason)
        seventhSeason.add(episodes: firstEpisodeOfSeventhSeason, secondEpisodeOfSeventhSeason)
        
        
        return [firstSeason, secondSeason, thirdSeason, fourthSeason, fifthSeason, sixthSeason, seventhSeason].sorted()
    }
    
    func season(named name: String) -> Season? {
        return seasons.first { $0.name.uppercased() == name.uppercased() }
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
