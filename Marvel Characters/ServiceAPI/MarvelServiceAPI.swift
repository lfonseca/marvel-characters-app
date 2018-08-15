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
    case character(id: String)
}

extension MarvelServiceAPI: TargetType {
    
    var baseURL: URL { return URL(string: "https://gateway.marvel.com")! }
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .character(let id):
            return "/v1/public/characters/\(id)"
        }
    }
    var method: Method {
        return .get
    }
    var task: Task {
        return .requestPlain
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    var sampleData: Data {
        return "Sample".data(using: .utf8)!
    }
    
}
