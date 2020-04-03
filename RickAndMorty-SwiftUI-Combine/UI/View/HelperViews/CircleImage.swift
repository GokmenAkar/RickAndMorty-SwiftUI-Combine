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
    
    let gradient = LinearGradient(gradient: Gradient(colors:[ Color("Rick"), Color("RMGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing)
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
//            .overlay(Circle().stroke(gradient, lineWidth: 4))
//            .shadow(radius: 8)
            .padding(8)
    }
}
