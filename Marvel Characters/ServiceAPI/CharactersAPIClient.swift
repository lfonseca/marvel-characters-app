//
//  CharactersDataProvider.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Alamofire

protocol CharactersAPIClient {
    func getAllCharacters(on completion: @escaping (Result<Any>) -> Void)
    func getCharacter(by id: String, on completion: @escaping (Result<Any>) -> Void)
}
