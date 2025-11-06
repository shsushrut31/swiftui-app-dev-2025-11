//
//  VideoPlayerApp.swift
//  VideoPlayer
//
//  Created by Michael Gauthier on 2025-10-31.
//

import SwiftUI

@main
struct VideoPlayerApp: App {
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().tintColor = .white
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
