//
//  DetailView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 25.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let detail: RMWorldResult!
    
    let normalSize = CGSize(width: 162, height: 162)
    let zoomSize = CGSize(width: 250, height: 250)
    
    @State var animateImage: Bool = false
    var body: some View {
        
            VStack(spacing: 12) {
                CircleImage(imageURL: detail.image ?? "",
                            imageSize: animateImage ? zoomSize : normalSize)
                    .onTapGesture {
                        withAnimation {
                            self.animateImage.toggle()
                        }
                }
                
                Text(detail.name ?? "")
                    .font(.title)
                    .foregroundColor(.primary)
                
                InfoView(infoTitle: "Status",
                         info: detail.status?.rawValue ?? "-",
                         isStatus: true,
                         status: detail.status)
                InfoView(infoTitle: "Species",
                         info: detail.species ?? "")
                InfoView(infoTitle: "Type",
                         info: detail.type!.isEmpty ? "-" : detail.type!)
                InfoView(infoTitle: "Gender",
                         info: detail.gender?.rawValue ?? "-")
                InfoView(infoTitle: "Origin",
                         info: detail.origin?.name ?? "-")
                InfoView(infoTitle: "Location", info: detail.location?.name ?? "-")
                Spacer()
                
            }
            .padding()
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(detail: RMWorld.exampleData().first!).environment(\.colorScheme, .light)
    }
}
