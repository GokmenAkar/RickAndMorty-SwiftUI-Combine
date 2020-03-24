//
//  NetworkService.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit.UIImage
import Combine


final class NetworkService {
    private let imageCache = NSCache<NSString, UIImage>()
    
    func baseRequest<T>(request: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        guard let urlRequest = urlRequestWith(request: request) else { fatalError("Invalid URL") }
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
}

extension NetworkService {
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
    
    func loadImage(from urlString: String) -> AnyPublisher<UIImage?, Never> {
        guard
            imageCache
                .object(forKey: urlString as NSString) == nil else {
                    return Just(imageCache.object(forKey: urlString as NSString))
                        .eraseToAnyPublisher()
        }
        
        guard
            let url = URL(string: urlString) else {
                fatalError("Invalid URL")
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .catch { _ in Just(nil) }
            .map { [unowned self] in
                guard $0 != nil else { return nil }
                self.imageCache.setObject($0!, forKey: urlString as NSString)
                return $0
        }
        .subscribe(on: RunLoop.current)
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}



