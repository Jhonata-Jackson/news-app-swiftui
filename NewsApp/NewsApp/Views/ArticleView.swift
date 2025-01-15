//
//  ArticleView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    @State var isLoading: Bool
    let article: Article
    
    var body: some View {
        HStack {
            if let imgUrl = article.image, let url = URL(string: imgUrl) {
                URLImage(
                    url: url,
                    options: URLImageOptions(
                        identifier: article.id.uuidString,
                        cachePolicy: .returnCacheElseLoad(
                            cacheDelay: nil,
                            downloadDelay: 1)
                    ),
                    failure: { error, _ in
                        PlaceholderImageView()
                    },
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    })
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                if let date = article.date {
                    HStack(spacing: 4) {
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                        Text(date, style: .time)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ArticleView(isLoading: false, article: Article.dummyData.first!)
}
