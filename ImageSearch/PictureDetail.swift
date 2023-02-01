//
//  PictureDetail.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

//MARK: - PictureDetail
struct PictureDetail: View {
    var picture: Result
    
    @State var data: Data?
    
    var body: some View {
        VStack {
            
            //MARK: - Image Display
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding(5)
                
            } else {
                Image(systemName: "photo")
                    .onAppear {
                        fetchData(urlString: picture.urls.regular)
                    }
            }
            
            //MARK: - Different information
            // Create a Grid to display the information of the picture
            Grid(alignment: .bottom, horizontalSpacing: 40, verticalSpacing: 10) {
                GridRow {
                    HStack {
                        Image(systemName: "camera")
                        Text("\(picture.user.name)")
                    }
                        .gridCellColumns(2)
                        .gridCellAnchor(.center)
                }
                
                GridRow {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.green)
                        Text("\(picture.likes)")
                    }
                    
                    HStack {
                        Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle")
                            .foregroundColor(.blue)
                        Text("\(picture.width)x\(picture.height)")
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: 100, alignment: .bottom)
            
            //MARK: - Image's Description
            if let description = picture.description {
                Divider()
                    .frame(maxWidth: 200)
                
                Text(description)
                    .padding()
            }
        
        }
    }
    
    // Function used to fetch the photo to display
    private func fetchData(urlString: URL) {
        
        let task = URLSession.shared.dataTask(with: urlString) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
