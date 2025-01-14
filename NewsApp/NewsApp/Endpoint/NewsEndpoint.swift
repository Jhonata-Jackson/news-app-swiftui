//
//  NewsEndpoint.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsApi {
    case getNews
}

extension NewsApi: APIBuilder {
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(path))
    }
    
    
}
