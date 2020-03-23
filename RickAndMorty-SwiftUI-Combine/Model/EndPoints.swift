//
//  EndPoints.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

enum EndPoints: StringLiteralType {
    case character = "character/"
    case location  = "location/"
    case episode   = "episode/"
    
    var description: String {
        return self.rawValue
    }
}
