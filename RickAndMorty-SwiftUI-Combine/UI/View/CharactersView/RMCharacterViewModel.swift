//
//  RMCharacterViewModel.swift
//  RickAndMorty-SwiftUI-Combine
//
//  Created by Developer on 23.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Combine
import UIKit.UIImage

final class RMCharacterViewModel: ObservableObject {
    private lazy var service = NetworkService()
    private var cancellable: AnyCancellable?
    
    @Published var characters = RMWorld(info: nil, results: [RMWorldResult]())
    
    var page: Int = 0
    
    func getCharacters() {
        let request = RMCharacterRequest()
        page += 1
        request.page = page 
        cancellable = service
            .baseRequest(request: request)
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.characters) }
            .sink(receiveValue: { (value) in
                self.characters.results += value.results
            })
    }
}
