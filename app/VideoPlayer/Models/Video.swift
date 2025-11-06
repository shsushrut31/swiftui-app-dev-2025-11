//
//  Video.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: Author
}

struct Author: Identifiable, Codable {
    let id: String
    let name: String
}

extension Video {
    static func sortedByDate(_ videos: [Video]) -> [Video] {
        videos.sorted { $0.publishedAt > $1.publishedAt }
    }
}
