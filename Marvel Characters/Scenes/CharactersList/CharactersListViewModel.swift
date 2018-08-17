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
    fileprivate var characters: [Character]
    fileprivate let apiService: CharactersAPIClient
    
    var numberOfCharacters: Int {
        return characters.count
    }
    
    init(view: CharactersListView?, service: CharactersAPIClient) {
        self.view = view
        self.apiService = service
        characters = []
    }
    
    func loadCharacters() {
        apiService.getAllCharacters { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.view?.updateView(for: .dataUpdated)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func character(for row: Int) -> CharacterViewData {
        let character = characters[row]
        return CharacterViewData(from: character)
    }
    
}
