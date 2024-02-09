//
//  SwiftUIView.swift
//  
//
//  Created by sparemac on 09/02/24.
//

import SwiftUI

struct ShowDetail: View {
    @ObservedObject var showDetailVM: TVShowsViewModel
    var body: some View {
        AsyncImage(url: showDetailVM.imageUrl) { image in
            image.image?.resizable().padding()
        }.frame(width: UIScreen.main.bounds.width, height: 600)
        if showDetailVM.totalSeasons > 0 {
            ForEach(1...showDetailVM.totalSeasons, id: \.self) { val in
                SeasonView(season: val, title: showDetailVM.title, posterString: showDetailVM.poster ?? "")
            }
        }
    }
}

#Preview {
    ShowDetail(showDetailVM: TVShowsViewModel())
}
