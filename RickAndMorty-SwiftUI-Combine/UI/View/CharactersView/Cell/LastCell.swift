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
    
    var body: some View {
        let gradientColor = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(gradient: gradientColor,
                                            startPoint: .topTrailing,
                                            endPoint: .bottomLeading)
        
        return
            VStack {
                Circle()
                    .trim(from: 0.2, to: 1)
                    .stroke(linearGradient, lineWidth: 4)
                    .frame(width: 60, height: 60)
                    .padding()
                    .rotationEffect(.degrees(720))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                    .onAppear {
                        self.vm.getCharacters()
                }
        }
    }
}

struct LastCell_Previews: PreviewProvider {
    static var previews: some View {
        LastCell(vm: RMCharacterViewModel()).previewLayout(.sizeThatFits)
    }
}
