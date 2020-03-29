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
    
    var sayi: Int = 0
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBar(searchText: .constant("Search"))
                        
                    List(0...viewModel.characters.results.count, id: \.self) { index in
                        if index == self.viewModel.characters.results.count {
                            LastCell(vm: self.viewModel)
                        } else {
                            NavigationLink(destination: DetailView(detail: self.viewModel.characters.results[index])) {
                                CharacterCell(character: self.viewModel.characters.results[index])
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Characters", displayMode: .inline)
        }
        .onAppear {
            self.viewModel.getCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView().environment(\.colorScheme, .dark)
    }
}

struct SearchBar : View {
    @Binding var searchText: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText) {

            }
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0 : 1)
                
            }
        }
        .foregroundColor(colorScheme == .dark ? .black : .white)
        .background(Color.primary)

    }
}
