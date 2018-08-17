//
//  CharactersListSceneFactory.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

struct CharactersListSceneFactory: CharactersListSceneCreation {
    
    static func create(from coordinator: CharactersFlowCoordinator) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard  let view = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController") as? CharactersListViewController else {
            return UIViewController()
        }
        
        let apiService = MarvelAPIClient()
        let viewModel = CharactersListViewModel(view: view, coordinator: coordinator, service: apiService)
        view.viewModel = viewModel
        
        return view
    }
    
}
