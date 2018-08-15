//
//  MarvelCharactersAPIProvider.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Alamofire
import Moya

import SwiftyJSON

protocol CharactersAPIProvider {
    func request(_ target: MarvelServiceAPI, completion: @escaping Completion)
}

struct MarvelCharactersAPIProvider: CharactersAPIProvider {
    fileprivate let provider = MoyaProvider<MarvelServiceAPI>()
    
    func request(_ target: MarvelServiceAPI, completion: @escaping Completion) {
        provider.request(target, completion: completion)
    }
    
}
