//
//  Picture.swift
//  ImageSearch
//
//  Created by Adrien CHABAUD on 2023-01-31.
//

import Foundation


// MARK: - Picture
struct Picture: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let width, height: Int
    let altDescription: String
    let urls: Urls
    let likes: Int
    let user: User
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}

// MARK: - User
struct User: Codable {
    let name: String
}

