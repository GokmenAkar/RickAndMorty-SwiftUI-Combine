//
//  APIRequest.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BaseAPIRequest<T: Codable> {
    private(set) var baseURL: String = "https://rickandmortyapi.com/"
    
    var apiPath: String { "api/" }
    var endPoint: EndPoints! { nil }
    
    var contentType: String { "application/json" }
    var httpMethod: HTTPMethod { .get }
}


