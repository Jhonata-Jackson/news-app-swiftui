//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation

// MARK: - NewsResponse
struct ArticleResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable, Equatable {
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
        
    }
}

extension Article {
    static var dummyData: [Article] {
     [
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        ),
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        ),
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        ),
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        ),
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        ),
        .init(
            author: nil,
            url: "https://www.nature.com/articles/s41591-024-03340-9",
            source: "Nature.com",
            title: "Lifetime risk and projected burden of dementia - Nature.com",
            articleDescription: "A cohort study of over 15,000 US adults found that the lifetime risk of developing dementia from ages 55 to 95 is 42%, with the highest risk in APOE ε4 carriers, women and Black adults, and projected that approximately 1 million US adults will develop dementi…",
            image: "https://media.springernature.com/m685/springer-static/image/art%3A10.1038%2Fs41591-024-03340-9/MediaObjects/41591_2024_3340_Fig1_HTML.png",
            date: Date()
        )
     ]
    }
}
