//
//  ContentView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: RMCharacterViewModel = RMCharacterViewModel()
    
    var body: some View {
        ZStack {
            Color.init(colorScheme == .dark ? .systemBlue : .systemIndigo)
            NavigationView {
                List(viewModel.characters.results, id: \.id) { character in
                    Text(character.name ?? "yok ki")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
