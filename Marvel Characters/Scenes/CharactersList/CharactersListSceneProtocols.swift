//
//  CharactersListSceneProtocols.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import Foundation

enum CharactersListState {
    case loading
    case dataUpdated
    case loadingMoreData
    case failure
}

protocol CharactersListView: class {
    var viewModel: CharactersListBusinessLogic? {get set}
    func updateView(for state: CharactersListState)
}

protocol CharactersListBusinessLogic {
    var view: CharactersListView? {get}
    var numberOfCharacters: Int {get}
    func loadCharacters()
    func character(for row: Int) -> CharacterViewData
}
