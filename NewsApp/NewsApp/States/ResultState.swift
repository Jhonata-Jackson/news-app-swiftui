//
//  ResultState.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
