//
//  TestCharacterViewData.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

@testable import Marvel_Characters

struct TestCharacterViewData: CharacterViewData {
    var name: String = "Test Hero"
    var thumbnailURL: URL?
}
