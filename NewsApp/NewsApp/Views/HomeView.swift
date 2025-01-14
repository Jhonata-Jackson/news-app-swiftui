//
//  ContentView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct HomeView: View {
    
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
                    }
                    .navigationTitle(Text("News"))
                }
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}

#Preview {
    HomeView()
}
