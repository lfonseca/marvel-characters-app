//
//  MockCharacterDetailsViewModel.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//
import Foundation

@testable import Marvel_Characters

class MockCharacterDetailsViewModel: CharacterDetailsBusinessLogic {
    var title: String = "Test Hero"
    var imageURL: URL?
    var numberOfSections: Int = 1
    
    func numberOfRows(for section: Int) -> Int {
        return 10
    }
    
    func title(for section: Int) -> String {
        return "Section Title"
    }
    
    func info(for row: Int) -> String {
        return "Row Info"
    }
    
}
