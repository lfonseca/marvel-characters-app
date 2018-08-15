//
//  MarvelServiceAPITest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble
import Alamofire
import Moya

@testable import Marvel_Characters

class MarvelServiceAPITest: QuickSpec {
    
    override func spec() {
        describe("Marvel service API") {
            var endpoint: MarvelServiceAPI!
            describe("characters endpoint") {
                endpoint = .characters
                it("should initialize correctly") {
                    expect(endpoint.baseURL.absoluteString).to(equal("https://gateway.marvel.com"))
                    expect(endpoint.path).to(equal("/v1/public/characters"))
                    expect(endpoint.method).to(equal(.get))
                    expect(endpoint.headers?.values).to(contain("application/json"))
                }
            }
        }
    }
    
}
