//
//  ImageSearchApp.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

@main
struct ImageSearchApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .navigationTitle("Image Search")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
