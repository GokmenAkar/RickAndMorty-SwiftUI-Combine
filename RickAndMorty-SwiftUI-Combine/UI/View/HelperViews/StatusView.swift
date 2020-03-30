//
//  StatusView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 30.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    @State var status: Status
    
    var body: some View {
        HStack {
            Text("status:")
                .foregroundColor(.gray)
                .font(.caption)
                .font(.system(size: 12))
            
            Button(action: {
                self.status = .alive
            }) {
                Text("Alive")
            }.modifier(ButtonModifier(status: .alive, isSelected: self.status == .alive))
            
            Button(action: {
                self.status = .dead
            }) {
                Text("Dead")
            }.modifier(ButtonModifier(status: .dead, isSelected: self.status == .dead))
            
            Button(action: {
                self.status = .unknown
            }) {
                Text("Unknown")
            }.modifier(ButtonModifier(status: .unknown, isSelected: self.status == .unknown))
        }
        .padding()
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(status: .dead).previewLayout(.sizeThatFits)
    }
}

struct ButtonModifier: ViewModifier {
    let status: Status
    let isSelected: Bool
    
    var color: Color {
        get {
            switch status {
            case .alive: return .green
            case .dead: return .red
            case .unknown: return .orange
            }
        }
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.system(size: 12))
            .foregroundColor(color.opacity(isSelected ? 1.0 : 0.75))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(color.opacity(isSelected ? 0.75 : 0.20), lineWidth: 2)
        )
    }
}
