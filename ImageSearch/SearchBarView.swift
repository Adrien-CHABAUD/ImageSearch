//
//  SearchBarView.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-02-01.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    var backColor: Color = .blue
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backColor)
            .foregroundColor(.white)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SearchBarView: View {
    @State private var query: String = ""
    @State private var isFieldEmpty = true
    
    var body: some View {
        
        VStack {
            Text("Let's search new pictures !")
                .font(.title)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $query)
                    .onChange(of: query) { newValue in
                        // Check if the textField has something
                        // written
                        if query == "" {
                            isFieldEmpty = true
                        } else {
                            isFieldEmpty = false
                        }
                    }
                
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        
        
        HStack {
            NavigationLink {
                // Switch to the results screen
                ResultSearch(query: query)
            } label: {
                Text("Search")
            }.buttonStyle(GrowingButton(backColor: .blue))
                .disabled(isFieldEmpty)
            
            Button {
                // Empty & block the buttons
                self.query = ""
                isFieldEmpty = true
            } label: {
                Text("Clear")
            }
            .buttonStyle(GrowingButton(backColor: .red))
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
