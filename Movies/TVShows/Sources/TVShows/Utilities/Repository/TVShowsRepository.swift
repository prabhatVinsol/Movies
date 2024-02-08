//
//  File.swift
//  
//
//  Created by sparemac on 08/02/24.
//

import Foundation

protocol RepoProtocol {
    associatedtype T: Decodable
    var search: String {get set}
    func getShow(_ success: @escaping(T?) -> Void, failure: @escaping(Error) -> Void)
}

class TVShowRepo: RepoProtocol {
    
    typealias T = TVSeries
    
    var search: String
    
    private var urlString: String? {
        "http://www.omdbapi.com/?t=\(search)&type=series&apikey=\(OMDB_API_KEY)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    init(search: String) {
        self.search = search
    }

    func getShow(_ success: @escaping (TVSeries?) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString ?? "") else { return}
        let apiClient = APIClient(url: url)
        apiClient.fetch { (data, error) in
            if let error = error {
                failure(error)
            }
            if let value = data {
                let tvSeries = try? JSONDecoder().decode(TVSeries.self, from: value)
                success(tvSeries)
            }
        }
    }
    
}
//http://www.omdbapi.com/?t=Game%20of%20&type=series&apikey=dcc15c2f
