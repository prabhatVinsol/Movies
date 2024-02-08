//
//  ContentView.swift
//  Movies
//
//  Created by sparemac on 07/02/24.
//

import SwiftUI

struct ContentView: View {

    @State private var showPoster: Bool = true
    @State private var posterOffset: Int = 0
    var body: some View {
        if showPoster {
            ScrollView {
                PosterOptions(offSet: $posterOffset, optionSelected: $showPoster)
            }
        } else {
            Text("Show Selected View").gesture(TapGesture(count: 1).onEnded({ () in
                withAnimation(.default) {
                    showPoster.toggle()
                    withAnimation(.spring) {
                        posterOffset = 0
                    }
                }
            })).font(.title).background(Color.blue)
        }
    }
}

#Preview {
    ContentView()
}
