//
//  RMWorld.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//


import SwiftUI

// MARK: - RMWorld
struct RMWorld: Codable {
    let info: Info?
    var results: [RMWorldResult]
    
    static func exampleData() -> [RMWorldResult] {
        let name =  "Rick Sanchez"
        let status =  Status.alive
        let species =  "Human"
        let type =  ""
        let gender =  Gender.male
        let origin =  Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1")
        let location = Location(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20")
        let image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        
        let url = "https://rickandmortyapi.com/api/character/1"
        let created = "2017-11-04T18:48:46.250Z"
        let residents =  [
            "https://rickandmortyapi.com/api/character/38",
            "https://rickandmortyapi.com/api/character/45",
            "https://rickandmortyapi.com/api/character/71",
            "https://rickandmortyapi.com/api/character/82",
            "https://rickandmortyapi.com/api/character/83",
            "https://rickandmortyapi.com/api/character/92",
            "https://rickandmortyapi.com/api/character/112",
            "https://rickandmortyapi.com/api/character/114",
            "https://rickandmortyapi.com/api/character/116",
            "https://rickandmortyapi.com/api/character/117",
            "https://rickandmortyapi.com/api/character/120",
            "https://rickandmortyapi.com/api/character/127",
            "https://rickandmortyapi.com/api/character/155",
            "https://rickandmortyapi.com/api/character/169",
            "https://rickandmortyapi.com/api/character/175",
            "https://rickandmortyapi.com/api/character/179",
            "https://rickandmortyapi.com/api/character/186",
            "https://rickandmortyapi.com/api/character/201",
            "https://rickandmortyapi.com/api/character/216",
            "https://rickandmortyapi.com/api/character/239",
            "https://rickandmortyapi.com/api/character/271",
            "https://rickandmortyapi.com/api/character/302",
            "https://rickandmortyapi.com/api/character/303",
            "https://rickandmortyapi.com/api/character/338",
            "https://rickandmortyapi.com/api/character/343",
            "https://rickandmortyapi.com/api/character/356",
            "https://rickandmortyapi.com/api/character/394"
        ]
        
        return [
            RMWorldResult(id: 1, name: name, status: status, species: species, type: type, gender: gender, origin: origin, location: location, image: image, url: url, created: created, dimension: "Dimension C-137", residents: residents, air_date: created),
            RMWorldResult(id: 1, name: name, status: status, species: species, type: type, gender: gender, origin: origin, location: location, image: image, url: url, created: created, dimension: "Dimension C-137", residents: residents, air_date: created),
            RMWorldResult(id: 1, name: name, status: status, species: species, type: type, gender: gender, origin: origin, location: location, image: image, url: url, created: created, dimension: "Dimension C-137", residents: residents, air_date: created),
            RMWorldResult(id: 1, name: name, status: status, species: species, type: type, gender: gender, origin: origin, location: location, image: image, url: url, created: created, dimension: "Dimension C-137", residents: residents, air_date: created)
        ]
    }
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
    case all = "All"
    func statusColor() -> Color {
        switch self {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .orange
        case .all:
            return Color("Rick")
        }
    }
}


