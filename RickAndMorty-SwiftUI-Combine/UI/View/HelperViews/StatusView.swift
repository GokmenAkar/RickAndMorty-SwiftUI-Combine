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
                    self.changeStatus(status: .all)
                }) {
                    Text("All")
                }
                .modifier(ButtonModifier(status: .all, isSelected: self.status == .all))
                
                Button(action: {
                    self.changeStatus(status: .alive)
                }) {
                    Text("Alive")
                }
                .modifier(ButtonModifier(status: .alive, isSelected: self.status == .alive))
                
                Button(action: {
                    self.changeStatus(status: .dead)
                }) {
                    Text("Dead")
                }
                .modifier(ButtonModifier(status: .dead, isSelected: self.status == .dead))
                
                Button(action: {
                    self.changeStatus(status: .unknown)
                }) {
                    Text("Unknown")
                }
                .modifier(ButtonModifier(status: .unknown, isSelected: self.status == .unknown))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }
    
    func changeStatus(status: Status) {
        withAnimation {
            self.status = status
        }
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
            .frame(maxWidth: status == .all ? 38 : .infinity)
            .font(.system(size: 14))
            .foregroundColor(isSelected ? .white : status.statusColor().opacity(0.75))
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? status.statusColor().opacity(0.50) : .white))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(status.statusColor().opacity(isSelected ? 0.75 : 0.20), lineWidth: 2)
                    
        )
    }
}
