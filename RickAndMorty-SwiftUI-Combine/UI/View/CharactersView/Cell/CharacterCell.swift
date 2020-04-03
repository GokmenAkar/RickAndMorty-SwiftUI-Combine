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
    
    @State var isPressed: Bool = false
    
    init(character: RMWorldResult) {
        url = character.image!
        name = character.name ?? "no name"
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    CircleImage(imageURL: url).modifier(ShadowModifier())
                    Text(name)
                        .font(.headline)
                        .foregroundColor(Color("Rick"))
                    Spacer()
                }
                Divider()
            }
            if isPressed {
                withAnimation(.spring()) {
                    PopOver()
                }
            }
        }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: RMWorld.exampleData().first!)
            .previewLayout(.sizeThatFits)
    }
}
