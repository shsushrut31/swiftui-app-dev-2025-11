//
//  VideoPlayerView.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import SwiftUI

struct VideoPlayerView: View {
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        ZStack {
            if let player = viewModel.player {
                CustomVideoPlayer(player: player)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Rectangle()
                    .fill(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    )
            }
            
            VideoControlsOverlay(viewModel: viewModel)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(16/9, contentMode: .fit)
    }
}

#Preview {
    VideoPlayerView(viewModel:  VideoPlayerViewModel())
}
