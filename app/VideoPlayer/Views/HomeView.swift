//
//  HomeView.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = VideoPlayerViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.videos.count)")
            
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
