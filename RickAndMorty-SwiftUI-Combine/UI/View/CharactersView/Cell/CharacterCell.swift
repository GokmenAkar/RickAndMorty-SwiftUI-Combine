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
    var url: String
    var name: String
    
    init(character: RMWorldResult) {
        url = character.image!
        name = character.name ?? "no name"
    }
    
    var body: some View {
        HStack {
            CircleImage(imageURL: url)
            Text(name)
                .font(.headline)
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: RMWorld.exampleData().first!)
            .previewLayout(.sizeThatFits)
    }
}
