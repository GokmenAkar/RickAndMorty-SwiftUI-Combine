//
//  LastCell.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 26.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct LastCell: View {
    @ObservedObject var vm: RMCharacterViewModel
    @State var see = false
    @State var degree: Double = 0.0
    @State var scale: CGFloat = 1
    var body: some View {
        let gradientColor = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(gradient: gradientColor,
                                            startPoint: .topTrailing,
                                            endPoint: .bottomLeading)
        
        return
            VStack {
                Circle()
                    .trim(from: 0.2, to: 1.0)
                    .stroke(linearGradient, lineWidth: 4)
                    .frame(height: 40)
                    .padding()
                    .rotationEffect(.degrees(degree))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))

                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                    .onAppear {
                        self.scale = 1.3
                        self.degree = 720
                        self.vm.getCharacters()
                }
                Text("Loading...")
        }
    }
}

struct LastCell_Previews: PreviewProvider {
    static var previews: some View {
        LastCell(vm: RMCharacterViewModel()).previewLayout(.sizeThatFits)
    }
}
