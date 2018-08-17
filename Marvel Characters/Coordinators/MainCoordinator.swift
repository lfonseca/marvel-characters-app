//
//  MainCoordinator.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator, CharactersFlowCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let charactersListViewController = CharactersListSceneFactory.create(from: self)
        navigationController.pushViewController(charactersListViewController, animated: false)
    }
    
    func showDetails(from character: Character) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "CharacterDetailsViewController")
        navigationController.pushViewController(view, animated: true)
    }
    
}
