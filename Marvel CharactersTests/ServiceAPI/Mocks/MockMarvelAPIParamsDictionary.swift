//
//  MockMarvelAPIParamsDictionary.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

@testable import Marvel_Characters

struct MockMarvelAPIParams {
    
    static let apiKeyValue = "Some key"
    static let timestampValue = "Some timestamp"
    static let hashValue = "Some hash"
    static let dictionary = [
        "MarvelAPIParams": [
            "apikey": apiKeyValue,
            "ts": timestampValue,
            "hash": hashValue
        ]
    ]
    
}

struct InvalidInfo: MarvelAPIParamValue {
    static var key: String = "invalidKey"
}
