//
//  MockCharactersListViewModel.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

@testable import Marvel_Characters

class MockCharactersListViewModel: CharactersListBusinessLogic {
    
    var view: CharactersListView?
    var coordinator: CharactersFlowCoordinator = MockCharactersFlowCoordinator()
    var numberOfCharacters: Int = 5
    var didCallLoadCharacters = false
    var didCallSelectCharacter = false
    let testCharacter = TestCharacterViewData()
    
    func loadCharacters() {
        didCallLoadCharacters = true
    }
    
    func character(for row: Int) -> CharacterViewData {
        return testCharacter
    }
    
    func didSelectCharacter(at row: Int) {
        didCallSelectCharacter = true
    }
    
}
