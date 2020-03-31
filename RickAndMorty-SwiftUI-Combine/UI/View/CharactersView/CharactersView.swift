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
    
    @State private var showDetail: Bool = false
    
    @State private var selectedRM: RMWorldResult!
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                SearchBar(searchText: self.$viewModel.searchText)
                StatusView(status: self.$viewModel.status)
                Divider()
            }.zIndex(1)
            List {
                ForEach(0...self.viewModel.characters.results.count, id: \.self) { index in
                    HStack {
                        if index == self.viewModel.characters.results.count {
                            LastCell(vm: self.viewModel)
                        } else {
                            CharacterCell(character: self.viewModel.characters.results[index])
                                .onTapGesture {
                                    self.selectedRM = self.viewModel.characters.results[index]
                                    self.showDetail = true
                            }
                            .sheet(isPresented: self.$showDetail, content: {
                                DetailView(detail: self.selectedRM)
                            })
                        }
                    }
                }
            }
            .offset(y: 96)
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
