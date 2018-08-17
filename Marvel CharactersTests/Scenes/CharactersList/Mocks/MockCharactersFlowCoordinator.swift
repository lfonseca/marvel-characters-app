//
//  MockCharactersFlowCoordinator.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

@testable import Marvel_Characters

class MockCharactersFlowCoordinator: CharactersFlowCoordinator {
    var didCallShowDetails = false
    var characterReceived: Marvel_Characters.Character?
    
    func showDetails(from character: Marvel_Characters.Character) {
        didCallShowDetails = true
        characterReceived = character
    }
    
}
