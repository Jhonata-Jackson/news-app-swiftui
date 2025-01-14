//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String
    let source, title: String
    let description: String?
    let image: String?
    let date: Date
}
