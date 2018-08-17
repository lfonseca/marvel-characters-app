//
//  TestCharacter.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

@testable import Marvel_Characters

struct TestCharacter: Marvel_Characters.Character {
    var id: String = "Some id"
    var name: String = "Test Hero"
    var description: String = "The description goes here"
    var thumbnailURL: URL?
    var comics: [String] = []
    var series: [String] = []
    var stories: [String] = []
}
