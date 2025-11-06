//
//  CustomVideoPlayer.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import AVFoundation
import AVKit
import SwiftUI

struct CustomVideoPlayer: UIViewRepresentable {
    let player: AVPlayer?
    
    func makeUIView(context: Context) -> some PlayerUIView {
        let view = PlayerUIView()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.updatePlayer(player)
    }
}

final class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func updatePlayer(_ player: AVPlayer?) {
        playerLayer.player?.pause()
        playerLayer.player = player
    }
}
