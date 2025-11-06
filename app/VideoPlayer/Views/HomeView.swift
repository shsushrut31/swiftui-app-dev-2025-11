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
        GeometryReader { geometry in
            VStack(spacing: 0) {
                VideoPlayerView(viewModel: viewModel)
                    .frame(width: geometry.size.width)
                Divider()
                    .frame(height: 1)
                    .overlay(Color.black)
                
                VideoDetailsView(video: viewModel.currentVideo)
                    .frame(width: geometry.size.width)
                    .id(viewModel.currentVideo?.id)
            }
        }
        .navigationTitle("Video Player")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchVideos()
        }
    }
}

#Preview {
    HomeView()
}
