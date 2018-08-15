//
//  MarvelServiceAPI.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Moya

enum MarvelServiceAPI {
    case characters
}

extension MarvelServiceAPI: TargetType {
    
    var baseURL: URL { return URL(string: "https://gateway.marvel.com")! }
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        }
    }
    var method: Method {
        return .get
    }
    var task: Task {
        let parameters = [
            "apikey": MarvelAPIParam.value(for: APIKey.self),
            "ts": MarvelAPIParam.value(for: Timestamp.self),
            "hash": MarvelAPIParam.value(for: Hash.self)
        ]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    var sampleData: Data {
        return "Sample".data(using: .utf8)!
    }
    
}
