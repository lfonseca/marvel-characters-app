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
import Moya

@testable import Marvel_Characters

class MarvelAPIClientTest: QuickSpec {
    
    override func spec() {
        describe("Marvel API client") {
            let provider = MoyaProvider<MarvelServiceAPI>(stubClosure: MoyaProvider.immediatelyStub)
            let apiClient = MarvelAPIClient(provider: provider)
            it("successfully fetch characters from API") {
                apiClient.getAllCharacters { result in
                    if case .success(let characters) = result {
                        expect(characters[0].name).to(equal("3-D Man"))
                    }
                }
            }
        }
    }
    
}
