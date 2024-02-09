//
//  SwiftUIView.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import SwiftUI

struct SeasonView: View {
    @StateObject private var seasonViewModel = SeasonsViewModel()
    var season: Int
    var title: String
    var posterString: String
    init(season: Int, title: String, posterString: String) {
        self.season = season
        self.title = title
        self.posterString = posterString
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(seasonViewModel.seasonTitle).font(.headline).fontWeight(.semibold)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(seasonViewModel.episodeViewModel, id: \.id) { episodeViewModel in
                        EpisodeView(episodeViewModel: episodeViewModel, posterString: posterString)
                    }
                }
            }
        }.onAppear(perform: {
            seasonViewModel.getSeasonDetail(title, season: season)
        })
    }
}

#Preview {
    SeasonView(season: 1, title: "Game of throne", posterString: "")
}
