// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct TVShowList: View {
    @StateObject private var tvShowViewModel = TVShowsViewModel()
    
    @Binding public var offset: Int
    @Binding public var showPoster: Bool
    
    public init(_ offset: Binding<Int>, showPoster: Binding<Bool>) {
        _offset = offset
        _showPoster = showPoster
    }
    
    @available(iOS 13.0, *)
    public var body: some View {
        NavigationStack {
            VStack {
                if (!tvShowViewModel.isLoading) {
                    ScrollView {
                        ShowDetail(showDetailVM: tvShowViewModel)
                        Spacer()
                    }
                } else {
                    ProgressView().font(.title)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Back") {
                        withAnimation(.default) {
                            showPoster.toggle()
                            withAnimation(.spring) {
                                offset = 0
                            }
                        }
                    }
                }
            })
        }
        .searchable(text: $tvShowViewModel.search, placement: .toolbar, prompt: "Enter tv show name")
            

            
    }
}

#Preview {
    TVShowList(.constant(0), showPoster: .constant(true))
}
