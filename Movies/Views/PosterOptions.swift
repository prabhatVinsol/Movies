//
//  PosterOptions.swift
//  Movies
//
//  Created by sparemac on 08/02/24.
//

import SwiftUI

struct PosterOptions: View {
    @Binding var offSet: Int
    @Binding var optionSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            PosterSelectionView()
                .offset(y: -CGFloat(offSet))
                .gesture(TapGesture(count: 1).onEnded({ () in
                    withAnimation(.easeIn) {
                        offSet = Int(UIScreen.main.bounds.height/2)
                    } completion: {
                        optionSelected.toggle()
                    }
                }))
            PosterSelectionView( posterType: EntertainmentOption.tvShows)
                .offset(y: CGFloat(offSet))
                .gesture(TapGesture(count: 1).onEnded({ () in
                    withAnimation(.easeIn) {
                        offSet = Int(UIScreen.main.bounds.height/2)
                    } completion: {
                        optionSelected.toggle()
                    }
                }))
        }
    }
}

#Preview {
    PosterOptions(offSet: .constant(0), optionSelected: .constant(false))
}
