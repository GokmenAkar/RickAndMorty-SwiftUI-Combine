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
    
    lazy var request       = RMCharacterRequest()
    lazy var searchRequest = RMSearchRequest()
    
    @Published var characters = RMWorld(info: nil, results: [RMWorldResult]())
    @Published var isSearchBarHidden: Bool = false
    @Published var searchText: String = "" {
        didSet {
            searchCharacter(text: self.searchText)
        }
    }
    
    @Published var status: Status = .all {
        didSet {
            request.page = 0
            characters.results.removeAll()
            getCharacters()
        }
    }
    
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
                guard let self = self else { return }
                
                self.isLoading = false
                
                if self.status != .all {
                    self.characters.results += value.results.filter { $0.status == self.status }
                } else {
                    self.characters.results += value.results
                }
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
        if isLoading { return }
        isLoading = true
        
        searchRequest.name   = text
        searchRequest.status = status == .all ? "" : status.rawValue

        cancellable = service
            .baseRequest(request: searchRequest)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .catch { _ in  Just(self.characters) }
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { (value) in
                self.characters = value
            })
    }
    
    deinit {
        cancellable = nil
    }
}
