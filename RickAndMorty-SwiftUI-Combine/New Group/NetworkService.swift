//
//  NetworkService.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import Combine

final class NetworkService {
    
    func baseRequest<T>(request: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        guard let urlRequest = urlRequestWith(request: request) else { fatalError("Invalid URL") }
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
    func urlRequestWith<T>(request: BaseAPIRequest<T>) -> URLRequest? {
        let completeURL: String =
            request.baseURL +
            request.apiPath +
            request.endPoint.description
        
        var urlRequest: URLRequest = URLRequest(url: URL(string: completeURL)!)
        urlRequest.httpMethod = request.httpMethod.description
        urlRequest.setValue(request.contentType, forHTTPHeaderField: "Content-Type")
        print(urlRequest)
        
        return urlRequest
    }
}
