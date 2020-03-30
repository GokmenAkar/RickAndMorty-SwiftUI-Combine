//
//  ContentView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: RMCharacterViewModel = RMCharacterViewModel()
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    SearchBar(searchText: self.$viewModel.searchText)
                    StatusView(status: self.$viewModel.status)
                    Divider()
                }.disabled(true)
                ForEach(0...self.viewModel.characters.results.count, id: \.self) { index in
                    ZStack {
                        if index == self.viewModel.characters.results.count {
                            LastCell(vm: self.viewModel)
                        } else {
                            NavigationLink(destination: DetailView(detail: self.viewModel.characters.results[index])) {
                                EmptyView()
                            }.hidden()
                            CharacterCell(character: self.viewModel.characters.results[index])
                        }
                    }
                }
            }
            .navigationBarTitle("Characters", displayMode: .large)
        }
        .onAppear {
            self.viewModel.getCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
