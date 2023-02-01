//
//  Picture.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import Foundation
import SwiftUI


// MARK: - Picture
struct Picture: Hashable, Codable {
    let results: [Result]

}

// MARK: - Result
struct Result: Hashable, Codable {
    let width: Int
    let height: Int
    let description: String?
    let urls: Urls
    let likes: Int
    let user: User

}

// MARK: - Urls
struct Urls: Hashable, Codable {
    let raw, full, regular, small: URL
    let thumb: URL
}

// MARK: - User
struct User: Hashable, Codable {
    let name: String
}

