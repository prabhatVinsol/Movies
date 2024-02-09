//
//  File.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import Foundation

class SeasonsViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    var error: Error?
    private var seasons: Seasons? {
        didSet {
            self.episodes = seasons?.episodes ?? []
        }
    }
}

extension SeasonsViewModel {
    var seasonTitle: String {
        "Season \(seasons?.season ?? "")"
    }
    var episodesCount: Int {
        seasons?.episodes.count ?? 0
    }
    
    var episodeViewModel: [EpisodeViewModel] {
        episodes.map { episode in
            EpisodeViewModel(episode: episode)
        }
    }
    func getSeasonDetail(_ title: String, season: Int) {
        let seasonRepo = SeasonRepo(season: season, title: title)
        seasonRepo.getShow {[weak self] seasons in
            DispatchQueue.main.async {
                self?.seasons = seasons
            }
        } failure: {[weak self] error in
            self?.error = error
        }
    }
}

class EpisodeViewModel {
    var episode: Episode
    var id: String {
        episode.imdbID
    }
    var episodeTitle: String {
        episode.title
    }
    
    init(episode: Episode) {
        self.episode = episode
    }
    
}
