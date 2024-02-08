//
//  EntertainmentOption.swift
//  Movies
//
//  Created by sparemac on 07/02/24.
//

import Foundation

enum EntertainmentOption: String {
    case movies
    case tvShows
    
    var rawValue: String {
        switch self {
        case .movies:
            return "movie_poster"
        case .tvShows:
            return "tv_show_poster"
        }
    }
    
    var title: String {
        switch self {
        case .movies:
            return "Movies"
        case .tvShows:
            return "TV Shows"
        }
    }
}
