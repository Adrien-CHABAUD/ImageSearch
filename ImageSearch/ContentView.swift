//
//  ContentView.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

struct URLImage: View {
    let urlString: URL
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(.gray)
                .border(.green)
        }
        else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 130, maxHeight: 70)
                .background(.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    
    private static let initialColumns = 2
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(viewModel.pictures.results, id: \.self) { result in
                    NavigationLink {
                        PictureDetail(picture: result)
                    } label: {
                        URLImage(urlString: result.urls.thumb)
                    }
                }
            }.border(.blue)
        }.onAppear {
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
