//
//  MarvelAPIClientTest.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Quick
import Nimble
import Alamofire

@testable import Marvel_Characters

class MarvelAPIClientTest: QuickSpec {

    override func spec() {
        describe("Marvel API client") {
            describe("fetch characters") {
                it("succeeds") {
                    let apiClient = MockMarvelAPIClient.forSuccess()
                    apiClient.getAllCharacters { result in
                        if case .success(let characters) = result {
                            expect(characters[0].name).to(equal("3-D Man"))
                        }
                    }
                }
                it("fails") {
                    let expectedError = NSError(domain: "Tests", code: 500, userInfo: nil)
                    let apiClient = MockMarvelAPIClient.forFailure(with: expectedError)
                    apiClient.getAllCharacters { result in
                        if case .failure(let error) = result {
                            expect(error.localizedDescription).to(equal(expectedError.localizedDescription))
                        }
                    }
                }
            }
        }
    }

}
