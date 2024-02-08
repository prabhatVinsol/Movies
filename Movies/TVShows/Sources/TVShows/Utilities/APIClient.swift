//
//  File.swift
//  
//
//  Created by sparemac on 08/02/24.
//

import Foundation
class APIClient {
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(_ completion: @escaping(Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            completion(data, error)
        }.resume()
    }
}
