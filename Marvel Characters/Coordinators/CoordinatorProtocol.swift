//
//  CoordinatorProtocol.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get}
    func start()
}

protocol CharactersFlowCoordinator {
    func showDetails(from character: Character)
}
