//
//  MarvelCharactersDataProvider.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct MarvelAPIClient: CharactersAPIClient {
    fileprivate let provider: CharactersAPIProvider
    
    init(provider: CharactersAPIProvider = MarvelCharactersAPIProvider()) {
        self.provider = provider
    }
    
    func getAllCharacters(on completion: @escaping (Result<[Character]>) -> Void) {
        provider.request(.characters) { result in
            switch result {
            case .success(let response):
                let json = JSON(response.data)
                let responseResults = json["data"]["results"]
                let characters = responseResults.map { characterJSON -> Character in
                    return MarvelCharacter(from: characterJSON.1)
                }
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
