//
//  VideoPlayerViewModel.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import Foundation
import AVKit
import Combine

class VideoPlayerViewModel: ObservableObject {
    @Published var videos: [Video] = []
    @Published var player: AVPlayer?
    
    private let videoService: VideoServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(videoService: VideoServiceProtocol = VideoService.shared) {
        self.videoService = videoService
//        fetchVideos()
        //-TODO: remove below data once server issue fixed
        self.videos = Video.demoVideos()
    }
    
    func fetchVideos() {
        videoService.fetchVideos()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] videos in
                self?.videos = videos
            })
            .store(in: &cancellables)
    }
}
