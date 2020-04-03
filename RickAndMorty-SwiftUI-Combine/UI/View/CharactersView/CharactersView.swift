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
    
    @State private var newSize: CGSize = .zero
    var body: some View {
        ZStack {
        VStack(spacing: 0) {
            VStack {
                SearchBar(searchText: self.$viewModel.searchText)
                StatusView(status: self.$viewModel.status)
                Divider()
            }
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
        }
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

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct SizeModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
    func body(content: Content) -> some View {
        content.background(sizeView
        )
    }
}
