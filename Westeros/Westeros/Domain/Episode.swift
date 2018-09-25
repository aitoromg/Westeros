//
//  Episode.swift
//  Westeros
//
//  Created by Aitor Garcia on 25/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final class Episode {
    let title: String
    let issueDate: Date
    weak var season: Season?
    
    // Mark: - Initialization
    init(title: String, issueDate: Date, season: Season) {
        self.title = title
        self.issueDate = issueDate
        self.season = season
    }
}

extension Episode {
    var proxyForEquality: String {
        return "\(title)\(issueDate)\(season!.name)"
    }
    
    var proxyForComparison: String {
        return title.uppercased()
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "\(season!.name): \(title)"
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        // Orden alfabetico
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
