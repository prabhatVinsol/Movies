//
//  ContentView.swift
//  Movies
//
//  Created by sparemac on 07/02/24.
//

import SwiftUI
import TVShows

struct ContentView: View {

    @State private var showPoster: Bool = true
    @State private var posterOffset: Int = 0
    var body: some View {
        if showPoster {
            ScrollView {
                PosterOptions(offSet: $posterOffset, optionSelected: $showPoster)
            }
        } else {
            TVShows()
        }
    }
}

#Preview {
    ContentView()
}
