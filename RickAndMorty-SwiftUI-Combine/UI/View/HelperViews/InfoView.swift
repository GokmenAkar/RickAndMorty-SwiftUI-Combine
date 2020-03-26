//
//  InfoView.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 26.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let isStatus: Bool
    let infoTitle: String
    let info: String
    let status: Status
    
    init(infoTitle: String, info: String, isStatus:Bool? = false, status: Status? = .unknown) {
        self.isStatus = isStatus!
        self.infoTitle = infoTitle
        self.info = info
        self.status = status!
    }
    
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(infoTitle):").font(.system(Font.TextStyle.body, design: Font.Design.monospaced))
            Spacer()
            HStack(spacing: 6) {
                Text(info)
                    .fontWeight(.light)
                if isStatus {
                    Circle()
                        .foregroundColor(status.statusColor())
                        .frame(width: 16, height: 16)
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(infoTitle: "Status", info: "Alive", isStatus: true, status: .alive).previewLayout(.sizeThatFits)
    }
}
