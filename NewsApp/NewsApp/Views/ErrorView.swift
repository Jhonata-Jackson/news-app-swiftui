//
//  ErrorView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            
            Text("Ooops!")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(.black)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
            
        }
    }
}

#Preview {
    ErrorView(error: APIError.decodingError) {}
}
