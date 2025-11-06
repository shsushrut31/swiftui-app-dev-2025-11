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
    @Published var isPlaying: Bool = false
    @Published var currentVideoIndex: Int = 0
    @Published var isShowOverlayButtons: Bool = true
    private var hideControlsTask: DispatchWorkItem?
    
    private let videoService: VideoServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    var currentVideo: Video? {
        guard currentVideoIndex >= 0 && currentVideoIndex < videos.count else {
            return nil
        }
        return videos[currentVideoIndex]
    }
    
    var canGoPrevious: Bool {
        currentVideoIndex > 0
    }
    
    var canGoNext: Bool {
        currentVideoIndex < videos.count - 1
    }
    
    init(videoService: VideoServiceProtocol = VideoService.shared) {
        self.videoService = videoService
//        fetchVideos()
        //-TODO: remove below data once server issue fixed
        self.videos = Video.demoVideos()
        self.loadVideo(at: 0)
    }
    
    func fetchVideos() {
        videoService.fetchVideos()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] videos in
                self?.videos = videos
            })
            .store(in: &cancellables)
    }
    
    func loadVideo(at index: Int) {
        hideControlsTask?.cancel()
        player?.pause()
        player = nil
        
        guard index >= 0 && index < videos.count else { return }
        
        currentVideoIndex = index
        let video = videos[index]
        let videoURL = URL(string: video.hlsURL)
        
        guard let urlToLoad = videoURL else { return }
        
        player = AVPlayer(url: urlToLoad)
        isPlaying = false
        isShowOverlayButtons = true
    }
    
    func togglePlayPause() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
            hideControlsTask?.cancel()
            isShowOverlayButtons = true
        } else {
            player.play()
            autoHideVideoPlayerControls()
        }
        isPlaying.toggle()
    }
    
    func toggleHideShowVideoControls() {
        if isPlaying {
            isShowOverlayButtons.toggle()
            autoHideVideoPlayerControls()
        }
    }
    
    func playPrevious() {
        guard canGoPrevious else { return }
        loadVideo(at: currentVideoIndex - 1)
    }
    
    func playNext() {
        guard canGoNext else { return }
        loadVideo(at: currentVideoIndex + 1)
    }
    
    func autoHideVideoPlayerControls() {
        hideControlsTask?.cancel()
        
        let task = DispatchWorkItem { [ weak self] in
            self?.isShowOverlayButtons = false
        }
        hideControlsTask = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: task)
    }
}
