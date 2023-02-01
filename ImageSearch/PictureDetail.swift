//
//  PictureDetail.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

struct PictureDetail: View {
    var picture: Result
    
    @State var data: Data?
    
    var body: some View {
        VStack {
            
            Grid(alignment: .bottom, horizontalSpacing: 40, verticalSpacing: 10) {
                GridRow {
                    Text("Artist: \(picture.user.name)")
                        .gridCellColumns(2)
                        .gridCellAnchor(.center)
                }
                GridRow {
                    Text("Likes: \(picture.likes)")
                    Text("Size: \(picture.width)x\(picture.height)")
                }
            }.border(.red)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .bottom)
            
            
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
            } else {
                Image(systemName: "tshirt")
                    .onAppear {
                        fetchData(urlString: picture.urls.small)
                    }
            }
            
            Text("\(picture.alt_description)")
                .font(.caption)
            
        }
        .padding()
    }
    
    private func fetchData(urlString: URL) {
        
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
