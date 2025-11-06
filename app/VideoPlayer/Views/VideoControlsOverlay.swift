//
//  VideoControlsOverlay.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import SwiftUI

struct VideoControlsOverlay: View {
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        HStack(spacing: 40) {
            Button {
                viewModel.playPrevious()
            } label: {
                Image("previous")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.gray.opacity(0.7)))
            }
            .disabled(!viewModel.canGoPrevious)
            
            Button {
                viewModel.togglePlayPause()
            } label: {
                Image("play")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 70, height: 70)
                    .background(Circle().fill(Color.gray.opacity(0.7)))
            }
            
            Button {
                viewModel.playNext()
            } label: {
                Image("next")
                    .resizable()
                    .renderingMode(.original)
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.gray.opacity(0.7)))
            }
            .disabled(!viewModel.canGoNext)
        }
    }
}

#Preview {
    VideoControlsOverlay(viewModel: VideoPlayerViewModel())
}
