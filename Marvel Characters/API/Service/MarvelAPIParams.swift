//
//  MarvelAPIKeys.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

struct MarvelAPIParam {
    
    static func value<T: MarvelAPIParamValue>(for marvelAPIParamValueClass: T.Type,
                                              in bundleInfoDictionary: [String: Any]? = Bundle.main.infoDictionary) -> String {
        guard let bundleInfoDictionary = bundleInfoDictionary,
            let apiParamsDictionary = bundleInfoDictionary["MarvelAPIParams"] as? [String: AnyObject],
            let apiParamValue = apiParamsDictionary[marvelAPIParamValueClass.key] as? String else {
                return ""
        }
        return apiParamValue
    }
    
}

protocol MarvelAPIParamValue {
    static var key: String { get }
}

struct APIKey: MarvelAPIParamValue {
    static var key: String = "apikey"
}

struct Timestamp: MarvelAPIParamValue {
    static var key: String = "ts"
}

struct Hash: MarvelAPIParamValue {
    static var key: String = "hash"
}
