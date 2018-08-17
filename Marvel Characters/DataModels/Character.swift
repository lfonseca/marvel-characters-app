//
//  Character.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 15/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Character {
    var id: String {get set}
    var name: String {get set}
    var description: String {get set}
    var thumbnailURL: URL? {get set}
    var comics: [String] {get set}
    var series: [String] {get set}
    var stories: [String] {get set}
}

struct MarvelCharacter: Character {
    var id: String
    var name: String
    var description: String
    var thumbnailURL: URL?
    var comics: [String]
    var series: [String]
    var stories: [String]
    
    init(from json: JSON) {
        self.id = String(json["id"].int ?? 0)
        self.name = json["name"].string ?? ""
        self.description = json["description"].string ?? ""
        let thumbnailComponents = json["thumbnail"]
        let thumbnailURI = thumbnailComponents["path"].string ?? ""
        let thumbnailExtension = thumbnailComponents["extension"].string ?? ""
        self.thumbnailURL = URL(string: "\(thumbnailURI).\(thumbnailExtension)")
        let comicsCollection = json["comics"]
        self.comics = comicsCollection.items
        let seriesCollection = json["series"]
        self.series = seriesCollection.items
        let storieCollection = json["stories"]
        self.stories = storieCollection.items
    }
}

fileprivate extension JSON {
    
    var items: [String] {
        let items = self["items"]
        return items.map { itemInfo -> String in
            itemInfo.1["name"].string ?? ""
        }
    }
    
}
