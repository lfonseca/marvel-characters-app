//
//  CharacterDetailsProtocols.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

protocol CharacterDetailsBusinessLogic {
    var title: String {get}
    var imageURL: URL? {get}
    var numberOfSections: Int {get}
    func numberOfRows(for section: Int) -> Int
    func title(for section: Int) -> String
    func info(for row: Int) -> String
}
