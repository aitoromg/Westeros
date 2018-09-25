//
//  Season.swift
//  Westeros
//
//  Created by Aitor Garcia on 25/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season {
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
    
    // Mark: - Initialization
    init(name: String, releaseDate: Date) {
        self.name = name
        self.releaseDate = releaseDate
        self._episodes = Episodes()
    }
}

extension Date {
    init!(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yyyy"
        if let d = dateStringFormatter.date(from: dateString) {
            self.init(timeInterval: 0, since: d)
        } else {
            return nil
        }
    }
}

extension Season {
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard self == episode.season else {
            return
        }
        
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach { add(episode: $0) }
    }
    
}

extension Season {
    var proxyForEquality: String {
        return "\(name)\(releaseDate)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "Description of \(name)"
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        // Orden alfabetico
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
