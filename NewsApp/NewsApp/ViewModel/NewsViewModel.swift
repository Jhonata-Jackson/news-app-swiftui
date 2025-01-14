//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private var cancellables = Set<AnyCancellable>()
    private(set) var articles = [Article]()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                break
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellables.insert(cancellable)
    }
}
