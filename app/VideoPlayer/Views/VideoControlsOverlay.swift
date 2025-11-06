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
                    .renderingMode(.template)
                    .foregroundColor(viewModel.canGoPrevious ? .black : .gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.gray.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            .disabled(!viewModel.canGoPrevious)
            
            Button {
                viewModel.togglePlayPause()
            } label: {
                Image(viewModel.isPlaying ? "pause" : "play")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 70, height: 70)
                    .background(Circle().fill(Color.gray.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            
            Button {
                viewModel.playNext()
            } label: {
                Image("next")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(viewModel.canGoNext ? .black : .gray)
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .frame(width: 50, height: 50)
                    .background(Circle().fill(Color.gray.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            .disabled(!viewModel.canGoNext)
        }
    }
}

#Preview {
    VideoControlsOverlay(viewModel: VideoPlayerViewModel())
}
