//
//  File.swift
//  
//
//  Created by sparemac on 08/02/24.
//

import Foundation
import Combine

class TVShowsViewModel: ObservableObject  {
    @Published var search: String = ""
    @Published var isLoading: Bool = false
    
    private var cancellables: [AnyCancellable] = []
    
    private var tvSeries: TVSeries? {
        didSet {
            print("TvSeries: \(tvSeries)")
            isLoading = false
        }
    }
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
        isLoading = true
        tvRepo.getShow({ [weak self] tvSeries in
            self?.tvSeries = tvSeries
        }) { [weak self] error in
            self?.isLoading = false
        }
    }
}

extension TVShowsViewModel {
    var totalSeasons: Int {
        Int(tvSeries?.totalSeasons ?? "1") ?? 1
    }
    var title: String {
        tvSeries?.title ?? "title"
    }
    var imageUrl: URL? {
        URL(string: tvSeries?.poster ?? "")
    }
    
    var poster: String? {
        tvSeries?.poster ?? ""
    }
}

