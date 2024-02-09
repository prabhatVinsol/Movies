//
//  SwiftUIView.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import SwiftUI

struct EpisodeView: View {
    var episodeViewModel: EpisodeViewModel?
    var posterString: String
    init(episodeViewModel: EpisodeViewModel? = nil, posterString: String) {
        self.episodeViewModel = episodeViewModel
        self.posterString = posterString
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: posterString)) { image in
                image.image?.resizable().padding()
            }.frame(width: 200, height: 200)
            Text(episodeViewModel?.episodeTitle ?? "").font(.title3).padding()
        }
    }
}

#Preview {
    EpisodeView( posterString: "Movie")
}
