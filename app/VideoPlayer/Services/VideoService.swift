//
//  VideoService.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import Foundation
import Combine

protocol VideoServiceProtocol {
    func fetchVideos() -> AnyPublisher<[Video], Error>
}

class VideoService: VideoServiceProtocol {
    static let shared = VideoService()
    
    private let baseURL = "http://localhost:3000/videos"
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchVideos() -> AnyPublisher<[Video], any Error> {
        guard let url = URL(string: baseURL) else {
            return Fail(error: NSError(domain: "Invalid URL", code: 0)).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Video].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
