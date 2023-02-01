//
//  ContentView.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

//MARK: - URLImage
// Struct used to display the little thumbnails
struct URLImage: View {
    
    let urlString: URL
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        else {
            // Placeholder during loading of the images/if it does
            // not work.
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .onAppear {
                    // Make the call to fetch the images
                    fetchData()
                }
        }
    }
    //MARK: - URLImage(fetchData)
    private func fetchData() {
        
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    
    // Info used to create the grid
    private static let initialColumns = 2
    @State private var numColumns = initialColumns
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    var query = "glasgow"
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
      //MARK: - ScrollView
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(viewModel.pictures.results, id: \.self) { result in
                    NavigationLink {
                        // Show a new activity with information about
                        // the image selected
                        PictureDetail(picture: result)
                    } label: {
                        URLImage(urlString: result.urls.small)
                            .frame(maxWidth: 200, maxHeight: 400)
                            .cornerRadius(10)
                    }
                }
            }
        }.onAppear {
            // Set query and fetch the data
            viewModel.setQuery(query: query)
            viewModel.fetch()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack{
                    Text(query)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
