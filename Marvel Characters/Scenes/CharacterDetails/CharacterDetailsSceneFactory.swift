//
//  CharacterDetailsSceneFactory.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

struct CharacterDetailsSceneFactory: CharacterDetailsSceneCreation {
    
    static func create(for character: Character) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController else {
            return UIViewController()
        }
        
        let viewModel = CharacterDetailsViewModel(character: character)
        view.viewModel = viewModel
        
        return view
    }
    
}
