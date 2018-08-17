//
//  CharactersListViewController.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

class CharactersListViewController: UITableViewController {
    
    var viewModel: CharactersListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel?.loadCharacters()
    }
    
    fileprivate func setup() {
        title = "Personagens"
        clearsSelectionOnViewWillAppear = false
    }
    
}

extension CharactersListViewController: CharactersListView {
    
    func updateView(for state: CharactersListState) {
        switch state {
        case .dataUpdated:
            tableView.reloadData()
        default:
            break
        }
    }
    
}

// MARK: - Table view data source

extension CharactersListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfCharacters ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.reuseIdentifier,
                                                       for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        
        if let character = viewModel?.character(for: indexPath.row) {
            cell.populate(with: character)
        }
        
        return cell
    }

}
