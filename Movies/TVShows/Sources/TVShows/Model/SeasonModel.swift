//
//  File.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import Foundation


struct Seasons: Codable {
    let title, season, totalSeasons: String
    let episodes: [Episode]
    let response: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case season = "Season"
        case totalSeasons
        case episodes = "Episodes"
        case response = "Response"
    }
}

// MARK: - Episode
struct Episode: Codable {
    let title, released, episode, imdbRating: String
    let imdbID: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case episode = "Episode"
        case imdbRating, imdbID
    }
}
