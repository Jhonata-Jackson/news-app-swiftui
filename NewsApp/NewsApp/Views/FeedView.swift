//
//  FeedView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct FeedView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel =  NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            }
        }.onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openUrl(url)
    }
}

#Preview {
    FeedView()
}
