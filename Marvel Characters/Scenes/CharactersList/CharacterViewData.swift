//
//  CharacterViewData.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

struct CharacterViewData {
    var name: String
    var thumbnailURL: URL?
    
    init(from character: Character) {
        self.name = character.name
        self.thumbnailURL = character.thumbnailURL
    }
    
}
