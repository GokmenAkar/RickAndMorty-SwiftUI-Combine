//
//  RMWorldRequest.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class RMCharacterRequest: BaseAPIRequest<RMWorld> {
    var page: Int = 0 
    
    override var endPoint: EndPoints {
        return .character
    }
    
    override var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "page", value: "\(page)")
        ]
    }
}
