//
//  StatusView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 30.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct StatusView: View {
    @Binding var status: Status
    
    var body: some View {
        HStack(spacing: 16) {
            Text("status:")
                .foregroundColor(.gray)
                .font(.caption)
                .font(.system(size: 12))
            
            HStack {
                Button(action: {
                    self.status = .all
                }) {
                    Text("All")
                }
                .modifier(ButtonModifier(status: .all, isSelected: self.status == .all))
                
                Button(action: {
                    self.status = .alive
                }) {
                    Text("Alive")
                }
                .modifier(ButtonModifier(status: .alive, isSelected: self.status == .alive))
                
                Button(action: {
                    self.status = .dead
                }) {
                    Text("Dead")
                }
                .modifier(ButtonModifier(status: .dead, isSelected: self.status == .dead))
                
                Button(action: {
                    self.status = .unknown
                }) {
                    Text("Unknown")
                }
                .modifier(ButtonModifier(status: .unknown, isSelected: self.status == .unknown))
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(status: .constant(.all)).previewLayout(.sizeThatFits)
    }
}

struct ButtonModifier: ViewModifier {
    let status: Status
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: status == .all ? 32 : .infinity)
            .font(.system(size: 12))
            .foregroundColor(status.statusColor().opacity(isSelected ? 1.0 : 0.75))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(status.statusColor().opacity(isSelected ? 0.75 : 0.20), lineWidth: 2)
        )
    }
}
