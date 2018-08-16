//
//  MockMarvelAPIClient.swift
//  Marvel CharactersTests
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Moya

@testable import Marvel_Characters

struct MockMarvelAPIClient {
    
    static func forSuccess() -> MarvelAPIClient {
        let provider = MoyaProvider<MarvelServiceAPI>(stubClosure: MoyaProvider.immediatelyStub)
        return MarvelAPIClient(provider: provider)
    }
    
    static func forFailure(with expectedError: NSError) -> MarvelAPIClient {
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
