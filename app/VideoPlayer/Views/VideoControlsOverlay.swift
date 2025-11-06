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
                MediaControlIcon(
                    name: "previous",
                    isEnabled: viewModel.canGoPrevious
                )
                .frame(width: 50, height: 50)
                .background(Circle().fill(Color.white.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            .disabled(!viewModel.canGoPrevious)
            
            Button {
                viewModel.togglePlayPause()
            } label: {
                MediaControlIcon(
                    name: viewModel.isPlaying ? "pause" : "play",
                    isEnabled: true
                )
                .frame(width: 70, height: 70)
                .background(Circle().fill(Color.white.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            
            Button {
                viewModel.playNext()
            } label: {
                MediaControlIcon(
                    name: "next",
                    isEnabled: viewModel.canGoNext
                )
                .frame(width: 50, height: 50)
                .background(Circle().fill(Color.white.opacity(0.7)).stroke(.gray, style: StrokeStyle(lineWidth: 1.0)))
            }
            .disabled(!viewModel.canGoNext)
        }
    }
}

struct MediaControlIcon: View {
    let name: String
    let isEnabled: Bool
    
    var body: some View {
        Image(name)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(isEnabled ? .black : .gray)
            .aspectRatio(contentMode: .fit)
            .padding(10)
        
    }
}

#Preview {
    VideoControlsOverlay(viewModel: VideoPlayerViewModel())
}
