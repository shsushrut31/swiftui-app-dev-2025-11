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
            return Fail(error: VideoServiceError.invalidURL).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Video].self, decoder: JSONDecoder())
            .mapError { error -> VideoServiceError in
                if error is DecodingError {
                    return .decodingError
                }
                return .networkError(error)
            }
            .eraseToAnyPublisher()
    }
}

enum VideoServiceError: Error {
    case invalidURL
    case decodingError
    case networkError(Error)
}
