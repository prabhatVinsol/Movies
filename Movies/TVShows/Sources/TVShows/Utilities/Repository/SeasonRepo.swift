//
//  File.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import Foundation

class SeasonRepo: RepoProtocol {
    var season: Int
    var title: String
    typealias T = Seasons
    
    var urlString: String? {
        "http://www.omdbapi.com/?t=\(title)&Season=\(season)&type=series&apikey=dcc15c2f".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    init(season: Int, title: String) {
        self.season = season
        self.title = title
    }
    
    func getShow(_ success: @escaping (Seasons?) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString ?? "") else { return}
        let apiClient = APIClient.init(url: url)
        apiClient.fetch { data, error in
            if let error = error {
                failure(error)
            }
            if let value = data {
                let season = try? JSONDecoder().decode(Seasons.self, from: value)
                success(season)
            }
        }
    }
}
