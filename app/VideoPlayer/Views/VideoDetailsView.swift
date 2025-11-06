//
//  VideoDetailsView.swift
//  VideoPlayer
//
//  Created by Sushrut Shastri on 2025-11-05.
//

import SwiftUI
import MarkdownUI

struct VideoDetailsView: View {
    let video: Video?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let video = video {
                    Text(video.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    Text(video.author.name)
                        .font(.title3)
                        .foregroundStyle(Color.secondary)
                        .padding(.horizontal)
                    
                    Markdown(video.description)
                        .markdownTextStyle(\.text) {
                            FontSize(.em(0.5))
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                } else {
                    Text("No data available")
                        .foregroundStyle(Color.secondary)
                        .padding()
                }
            }
        }
    }
}
