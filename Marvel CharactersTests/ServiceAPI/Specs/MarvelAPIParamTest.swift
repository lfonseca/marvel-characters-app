//
//  MarvelAPIParamTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble

@testable import Marvel_Characters

class MarvelAPIParamTest: QuickSpec {
    
    override func spec() {
        describe("Marvel API params") {
            it("should have an API key") {
                let apiKey = MarvelAPIParam.value(for: APIKey.self, in: MockMarvelAPIParams.dictionary)
                expect(apiKey).to(equal(MockMarvelAPIParams.apiKeyValue))
            }
            it("should have a timestamp") {
                let timestamp = MarvelAPIParam.value(for: Timestamp.self, in: MockMarvelAPIParams.dictionary)
                expect(timestamp).to(equal(MockMarvelAPIParams.timestampValue))
            }
            it("should have a hash") {
                let hash = MarvelAPIParam.value(for: Hash.self, in: MockMarvelAPIParams.dictionary)
                expect(hash).to(equal(MockMarvelAPIParams.hashValue))
            }
            it("should return empty string for invalid key") {
                let invalidValue = MarvelAPIParam.value(for: InvalidInfo.self, in: MockMarvelAPIParams.dictionary)
                expect(invalidValue).to(beEmpty())
            }
        }
    }
    
}
