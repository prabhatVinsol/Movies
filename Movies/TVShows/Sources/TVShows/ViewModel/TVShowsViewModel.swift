//
//  File.swift
//  
//
//  Created by sparemac on 08/02/24.
//

import Foundation
import Combine

class TVShowsViewModel: ObservableObject  {
    private var tvSeries: TVSeries? {
        didSet {
            print("TvSeries: \(tvSeries)")
        }
    }
    private var cancellables: [AnyCancellable] = []
    
    @Published var search: String = ""
    
    init() {
        setupDebounce()
    }
}

extension TVShowsViewModel {
    private func setupDebounce() {
        $search.debounce(for: .seconds(0.75), scheduler: DispatchQueue.main).sink { [weak self] value in
            self?.getSearchedSeries()
        }.store(in: &cancellables)
    }
    
    func getSearchedSeries() {
        if search.isEmpty {
            return
        }
        let tvRepo = TVShowRepo(search: search)
        tvRepo.getShow({ [weak self] tvSeries in
            self?.tvSeries = tvSeries
        }) { error in
            print(error)
        }
    }
}

extension TVShowsViewModel {
    var totalSeasons: Int {
        Int(tvSeries?.totalSeasons ?? "0") ?? 0
    }
}

