// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct TVShows: View {
    
    public init() {}
    
    @available(iOS 13.0, *)
    public var body: some View {
        Text("Show Selected View").gesture(TapGesture(count: 1).onEnded({ () in
        })).font(.title).background(Color.blue)
    }
}

#Preview {
    TVShows()
}
