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
            VStack {
                VideoPlayerView(viewModel: viewModel)
                    .frame(width: geometry.size.width)
                
                VideoDetailsView()
                    .frame(width: geometry.size.width)
            }
        }
        .navigationTitle("Video Player")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HomeView()
}
