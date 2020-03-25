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
    
    var sayi: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(colorScheme == .dark ? .systemBlue : .systemIndigo)
                List(viewModel.characters.results, id: \.id) { character in
                    CharacterCell(character: character)
                    
                }
            }
            .navigationBarTitle("Characters")
        }
        .onAppear {
            self.viewModel.getCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
