//
//  RMSearchRequest.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 30.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class RMSearchRequest: BaseAPIRequest<RMWorld> {
    var name: String = ""
    var status: String = ""
    var page: Int = 0 
    override var endPoint: EndPoints {
        return .character
    }
    
    override var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "name", value: name.localizedLowercase),
            URLQueryItem(name: "status", value: status.localizedLowercase)
        ]
    }
}
