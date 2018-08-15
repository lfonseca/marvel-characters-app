//
//  MarvelCharactersDataProvider.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Alamofire
import Moya

struct MarvelAPIClient: CharactersAPIClient {
    
    static let instance = MarvelAPIClient()
    fileprivate let provider = MoyaProvider<MarvelServiceAPI>()
    
    private init() {}
    
    func getAllCharacters(on completion: @escaping (Result<Any>) -> Void) {
        provider.request(.characters) { result in
            switch result {
            case .success(let response):
                let json = try! JSONSerialization.jsonObject(with: response.data, options: []) as? [String : Any]
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getCharacter(by id: String, on completion: @escaping (Result<Any>) -> Void) {
        provider.request(.character(id: id)) { result in
            switch result {
            case .success(let response):
                let json = try! JSONSerialization.jsonObject(with: response.data, options: []) as? [String : Any]
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
