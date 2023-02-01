//
//  ContentView.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

struct ContentView: View {
    
    private static let initialColumns = 3
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    // Test Images
    @State private var pictures = [
        Picture(name: "tshirt"),
        Picture(name: "mustache"),
        Picture(name: "eyeglasses"),
        Picture(name: "brain"),
        Picture(name: "icloud"),
        Picture(name: "eye"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "icloud"),
        Picture(name: "tshirt"),
        Picture(name: "mustache"),
        Picture(name: "eyeglasses"),
        Picture(name: "brain"),
        Picture(name: "icloud"),
        Picture(name: "eye"),
        Picture(name: "icloud"),
        Picture(name: "eyeglasses"),
        Picture(name: "brain"),
        Picture(name: "icloud"),
        Picture(name: "eye"),
        Picture(name: "icloud"),
    ]
    
    @State private var searchText = "Test"
    
    @State private var results = [Picture]()
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(pictures) { picture in
                    NavigationLink {
                        PictureDetail(picture: picture)
                    } label: {
                        Image(systemName: picture.name)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .border(.green)
                    }
                }
            }.border(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
