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
    
    let request = RMCharacterRequest()

    @Published var characters = RMWorld(info: nil, results: [RMWorldResult]())
    
    var isLoading:Bool = false
    
    func getCharacters() {
        if isLoading { return }
        isLoading = true
        
        request.page += 1
        
        cancellable = service
            .baseRequest(request: request)
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.characters)}
            .sink(receiveValue: { [weak self] (value) in
                self!.isLoading = false
                self?.characters.results += value.results
            })
    }
    
    deinit {
        cancellable = nil
    }
}
