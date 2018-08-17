//
//  CharactersListViewModel.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

class CharactersListViewModel: CharactersListBusinessLogic {
    
    weak var view: CharactersListView?
    let coordinator: CharactersFlowCoordinator
    
    fileprivate let apiService: CharactersAPIClient
    fileprivate var characters: [Character]
    fileprivate var currentOffset: Int
    
    var numberOfCharacters: Int {
        return characters.count
    }
    
    init(view: CharactersListView?, coordinator: CharactersFlowCoordinator, service: CharactersAPIClient) {
        self.view = view
        self.apiService = service
        self.coordinator = coordinator
        characters = []
        currentOffset = 0
    }
    
    func loadCharacters() {
        view?.updateView(for: .loading)
        apiService.getAllCharacters(offset: currentOffset) { [unowned self] result in
            switch result {
            case .success(let characters):
                self.characters.append(contentsOf: characters)
                self.currentOffset += 20
                self.view?.updateView(for: .dataUpdated)
            case .failure:
                self.view?.updateView(for: .failure)
            }
        }
    }
    
    func character(for row: Int) -> CharacterViewData {
        let character = characters[row]
        return MarvelCharacterViewData(from: character)
    }
    
    func didSelectCharacter(at row: Int) {
        let character = characters[row]
        coordinator.showDetails(from: character)
    }
    
}
