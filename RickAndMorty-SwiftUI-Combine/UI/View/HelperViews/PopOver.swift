//
//  PopOver.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 31.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PopOver: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 12) {
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Add Favorites")
                }
            }
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "info.circle.fill")
                    Text("Go detail")
                }
            }
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                    Text("Close")
                }.foregroundColor(Color("RMGreen"))
            }
        }
        .frame(width: 150)
        .padding(4)
        .padding(.vertical, 12)
        .foregroundColor(Color("Rick"))
        .background(Color(.systemGray6))
    }
}

struct PopOver_Previews: PreviewProvider {
    static var previews: some View {
        PopOver().previewLayout(.sizeThatFits)
    }
}
