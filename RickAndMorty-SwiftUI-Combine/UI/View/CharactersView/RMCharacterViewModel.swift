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
    lazy var searchRequest = RMSearchRequest()
    
    @Published var characters = RMWorld(info: nil, results: [RMWorldResult]())
    
    var isLoading:Bool = false
    
    @Published var isSearchBarHidden: Bool = false
    @Published var searchText: String = "" {
        didSet {
            searchCharacter(text: self.searchText)
        }
    }
    
    func getCharacters() {
        if isLoading { return }
        isLoading = true
        
        request.page += 1
        
        cancellable = service
            .baseRequest(request: request)
            .receive(on: RunLoop.main)
            .catch { _ in Just(self.characters)}
            .sink(receiveValue: { [weak self] (value) in
                self?.isLoading = false
                self?.characters.results += value.results
            })
    }
    
    func hideSearchBar(startY: CGFloat, changeY: CGFloat) {
        cancellable = $isSearchBarHidden
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map { _ in startY > changeY }
            .sink { (value) in
                if self.isSearchBarHidden != value {
                    self.isSearchBarHidden = value
                }
        }
    }
    
    func searchCharacter(text: String) {
        searchRequest.name = text.localizedLowercase
        
        cancellable = service
            .baseRequest(request: searchRequest)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .catch { _ in Just(self.characters) }
            .sink(receiveValue: { (value) in
                print(value.results.count)
            })
    }
    
    deinit {
        cancellable = nil
    }
}
