//
//  ViewModel.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var pictures = Picture(results: [])
    
    func fetch() {
        guard let url = URL(string: "https://api.unsplash.com/search/photos/?client_id=6SOnuykxJVu08ZOGIQf8sQGxUSd1Zr1CvJbEK2ay3hs&query=scotland") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let pictures = try JSONDecoder().decode(Picture.self, from: data)
                DispatchQueue.main.async {
                    self?.pictures = pictures
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
        
    }
}
