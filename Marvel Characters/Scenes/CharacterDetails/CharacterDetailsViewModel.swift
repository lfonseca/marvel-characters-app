//
//  CharacterDetailsViewModel.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel: CharacterDetailsBusinessLogic {
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var title: String{
        return character.name
    }
    
    var imageURL: URL?{
        return character.thumbnailURL
    }
    
    var numberOfSections: Int {
        return 3
    }
    
    func numberOfRows(for section: Int) -> Int {
        switch section {
        case 0: return character.comics.count
        case 1: return character.stories.count
        case 2: return character.series.count
        default: return 0
        }
    }
    
    func title(for section: Int) -> String {
        switch section {
        case 0: return "Revistas"
        case 1: return "Histórias"
        case 2: return "Séries"
        default: return ""
        }
    }
    
    func info(for section: Int, at row: Int) -> String {
        switch section {
        case 0: return character.comics[row]
        case 1: return character.stories[row]
        case 2: return character.series[row]
        default: return ""
        }
    }
    
}
