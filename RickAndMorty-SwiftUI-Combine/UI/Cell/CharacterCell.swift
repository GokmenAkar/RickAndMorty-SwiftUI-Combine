//
//  CharacterCell.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 24.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CharacterCell: View {
    var url: URL
    var name: String
    init(character: RMWorldResult) {
        url = URL(string: character.image ?? "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
        name = character.name ?? "no name"
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: url,
                       placeholder: Text("Loading..."))
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 151/255, green: 206/255, blue: 76/255), lineWidth: 2))
                .shadow(radius: 8)
                .padding(8)
            
            Text(name)
        }.font(.system(size: 10))
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: RMWorldResult(id: 3, name: "Morty Rick", status: .alive, species: "ins", type: "", gender: .male, origin: Location(name: "world", url: ""), location: Location(name: "world", url: ""), image: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg", url: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg", created: "", dimension: "", residents: ["",""], air_date: "ee"))
            .previewLayout(.sizeThatFits)
    }
}
