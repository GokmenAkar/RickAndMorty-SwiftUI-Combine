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
    
    @State var animateImage: Bool = false
    var body: some View {
        VStack(spacing: 12) {
            CircleImage(imageURL: detail.image ?? "",
                        imageSize: CGSize(width: 162, height: 162))
                .onTapGesture {
                    self.animateImage = true
            }
            
            Text(detail.name ?? "")
                .font(.title)
                .foregroundColor(Color(.darkGray))
            
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
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(detail: RMWorld.exampleData().first!)
    }
}
