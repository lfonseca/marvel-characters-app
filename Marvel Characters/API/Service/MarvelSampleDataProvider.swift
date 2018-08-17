//
//  MarvelSampleDataProvider.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

struct MarvelSampleDataProvider {
    
    func provideSampleData(for filename: String) -> Data {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else { return Data() }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        } catch {
            return Data()
        }
    }
    
}
