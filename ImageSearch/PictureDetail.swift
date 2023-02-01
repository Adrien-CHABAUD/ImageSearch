//
//  PictureDetail.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import SwiftUI

struct PictureDetail: View {
    var picture: Picture
    
    var description = "A white t-shirt"
    var widthPicture = "100"
    var heightPicture = "200"
    var likes = "300"
    var publisher = "John Doe"
    
    var body: some View {
        VStack {
            Text("\(description)")
                .font(.largeTitle)
            
            /*Image(systemName: picture.name)
                .resizable()
                .scaledToFit()*/
            
            
            Grid(alignment: .bottom, horizontalSpacing: 40, verticalSpacing: 10) {
                GridRow {
                    Text("Artist: \(publisher)")
                        .gridCellColumns(2)
                        .gridCellAnchor(.center)
                }
                GridRow {
                    Text("Likes: \(likes)")
                    Text("Size: \(widthPicture)x\(heightPicture)")
                }
            }.border(.red)
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .bottom)
        }
        .padding()
    }
}
