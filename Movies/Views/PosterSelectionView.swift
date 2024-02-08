//
//  PosterSelectionView.swift
//  Movies
//
//  Created by sparemac on 07/02/24.
//

import SwiftUI

struct PosterSelectionView: View {
    var posterType: EntertainmentOption = EntertainmentOption.movies
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(posterType.title).font(.title).fontWeight(.bold)
            Image(posterType.rawValue)
                .resizable()
        }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: UIScreen.main.bounds.height/2)
            
    }
}

#Preview {
    PosterSelectionView()
}
