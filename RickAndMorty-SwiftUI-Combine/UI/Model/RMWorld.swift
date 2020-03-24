//
//  RMWorld.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

// MARK: - RMWorld
struct RMWorld: Codable {
    let info: Info?
    var results: [RMWorldResult]
}

// MARK: - RMWorldResult
struct RMWorldResult: Codable, Identifiable {
    let id: Int
    let name: String?
    let status: Status?
    let species: String?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let url: String?
    let created: String?
    
    //For Location
    let dimension: String?
    let residents: [String]?
    
    //For Episode
    let air_date: String?
    
}


// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next, prev: String?
}


enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
