//
//  RMCharacterViewModel.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Combine
import Foundation

final class RMCharacterViewModel: ObservableObject {
    private lazy var service = NetworkService()
    private var cancellable: AnyCancellable?
    
    @Published var characters = RMWorld(info: nil, results: [RMWorldResult]())
    
    init() {
        let request = RMCharacterRequest()
        cancellable = service
            .baseRequest(request: request)
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.characters) }
            .assign(to: \.characters, on: self)
    }
}
