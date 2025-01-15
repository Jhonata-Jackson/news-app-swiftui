//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation
import Combine

protocol ArticleViewModel {
    func getArticles()
    var isLoading: Bool { get }
}

enum ResultState: Equatable {
    
    case loading
    case success(content: [Article])
    case failed(error: Error)
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case (.success(content: let lhsType), .success(content: let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
}


class ArticleViewModelImpl: ObservableObject, ArticleViewModel {
    private let service: NewsService
    
    private var cancellables = Set<AnyCancellable>()
    private(set) var articles = [Article]()
    var isLoading: Bool {
        self.state == .loading
    }
    
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
