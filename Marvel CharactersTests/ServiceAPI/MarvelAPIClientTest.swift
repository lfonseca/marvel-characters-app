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
            describe("fetch characters") {
                it("succeeds") {
                    let apiClient = self.successStubAPIClient()
                    apiClient.getAllCharacters { result in
                        if case .success(let characters) = result {
                            expect(characters[0].name).to(equal("3-D Man"))
                        }
                    }
                }
                it("fails") {
                    let expectedError = NSError(domain: "Tests", code: 500, userInfo: nil)
                    let apiClient = self.failureStubAPIClient(with: expectedError)
                    apiClient.getAllCharacters { result in
                        if case .failure(let error) = result {
                            expect(error.localizedDescription).to(equal(expectedError.localizedDescription))
                        }
                    }
                }
            }
        }
    }

    fileprivate func successStubAPIClient() -> MarvelAPIClient {
        let provider = MoyaProvider<MarvelServiceAPI>(stubClosure: MoyaProvider.immediatelyStub)
        return MarvelAPIClient(provider: provider)
    }

    fileprivate func failureStubAPIClient(with expectedError: NSError) -> MarvelAPIClient {
        let serverErrorClosure = { (target: MarvelServiceAPI) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkError(expectedError) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        let provider = MoyaProvider<MarvelServiceAPI>(endpointClosure: serverErrorClosure, stubClosure: MoyaProvider.immediatelyStub)
        return MarvelAPIClient(provider: provider)
    }

}
