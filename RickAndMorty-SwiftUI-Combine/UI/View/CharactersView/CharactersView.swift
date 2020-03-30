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
            VStack {
                if !viewModel.isSearchBarHidden {
                    SearchBar(searchText: $viewModel.searchText)
                }
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
            .navigationBarTitle("Characters", displayMode: .inline)
        }
        .gesture(DragGesture()
        .onChanged { value in
            withAnimation {
                self.viewModel.hideSearchBar(startY: value.startLocation.y, changeY: value.location.y)
            }
            }
        )
            .onAppear {
                self.viewModel.getCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()//.environment(\.colorScheme, .dark)
    }
}

struct SearchBar : View {
    @Binding var searchText: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").padding(12)
            
            TextField("Search", text: $searchText) {
                UIApplication
                    .shared
                    .windows
                    .filter { $0.isKeyWindow }
                    .first?
                    .endEditing(true)
            }
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0 : 1)
                    .padding(.horizontal, 12)
                
            }
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .background(colorScheme == .dark ? Color(.darkGray) : Color(.systemGray6))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
        .padding(4)
        .padding(.bottom, 0)
        
    }
}
