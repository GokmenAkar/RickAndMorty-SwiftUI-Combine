//
//  SearchBar.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 30.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

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
        .foregroundColor(colorScheme == .dark ? .white : Color("Rick"))
        .background(self.colorScheme == .dark ? Color(.darkGray).cornerRadius(12) : Color(.systemGray6).cornerRadius(12))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("Rick"), lineWidth: 1))
        .padding(4)
        .padding(.bottom, 0)
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("")).previewLayout(.sizeThatFits)
    }
}
