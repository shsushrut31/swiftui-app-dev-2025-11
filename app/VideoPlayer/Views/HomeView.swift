//
//  HomeView.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            VideoPlayerView()
            
            VideoDetailsView()
        }
        .navigationTitle("Video Player")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
