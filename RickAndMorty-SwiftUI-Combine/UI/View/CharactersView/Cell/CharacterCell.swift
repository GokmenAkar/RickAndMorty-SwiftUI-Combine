//
//  CharacterCell.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 24.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
    var url: URL
    var name: String
    @State var isSetImage: Bool = false
    init(character: RMWorldResult) {
        url = URL(string: character.image!)!
        name = character.name ?? "no name"
    }
    
    var body: some View {
        HStack {
            WebImage(url: url)
                .onSuccess { image, cacheType in

            }
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .placeholder {
                Rectangle().foregroundColor(Color(.lightGray))
            }
                .indicator(.activity) // Activity Indicator
                .animation(.easeInOut(duration: 0.5)) // Animation Duration
                .transition(.fade) // Fade Transition
                .scaledToFit()
                .frame(width: 64, height: 64, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(red: 151/255, green: 206/255, blue: 76/255), lineWidth: 2))
                .shadow(radius: 8)
                .padding(8)
            Text(name)
                .font(.headline)
                
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: RMWorldResult(id: 3, name: "Morty Rick", status: .alive, species: "ins", type: "", gender: .male, origin: Location(name: "world", url: ""), location: Location(name: "world", url: ""), image: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg", url: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg", created: "", dimension: "", residents: ["",""], air_date: "ee"))
            .previewLayout(.sizeThatFits)
    }
}
