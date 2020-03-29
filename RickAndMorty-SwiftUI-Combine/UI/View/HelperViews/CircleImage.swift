//
//  CircleImage.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 25.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    let url: URL
    let imageSize: CGSize
    
    
    init(imageURL: String, imageSize: CGSize? = CGSize(width: 64, height: 64)) {
        self.imageSize = imageSize!
        self.url = URL(string: imageURL)!
    }
    
    var body: some View {
        WebImage(url: url)
            .onSuccess { image, cacheType in
                
        }
        .resizable()
        .placeholder(Image(systemName: "photo"))
        .placeholder {
            Rectangle().foregroundColor(Color(.lightGray))
        }
            .indicator(.activity) // Activity Indicator
            .animation(.easeInOut(duration: 0.5)) // Animation Duration
            .transition(.fade) // Fade Transition
            .aspectRatio(contentMode: .fill)
            .frame(width: imageSize.width, height: imageSize.height, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(red: 151/255, green: 206/255, blue: 76/255), lineWidth: 4))
            .shadow(radius: 8)
            .padding(8)
    }
}
