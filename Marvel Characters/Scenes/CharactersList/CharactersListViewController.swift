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
    fileprivate var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.loadCharacters()
        setup()
    }
    
    fileprivate func setup() {
        title = "Personagens"
        clearsSelectionOnViewWillAppear = false
        activityIndicator.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 60)
        tableView.tableFooterView = activityIndicator
        tableView.backgroundColor = .lightGray
    }
    
}

extension CharactersListViewController: CharactersListView {
    
    func updateView(for state: CharactersListState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
        case .dataUpdated:
            activityIndicator.stopAnimating()
            tableView.reloadData()
        case .failure:
            activityIndicator.stopAnimating()
            showAlertView(with: "Erro!", message: "Ocorreu um erro na sua requisição")
        }
    }
    
    fileprivate func showAlertView(with title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectCharacter(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if indexPath.row == viewModel.numberOfCharacters - 2 {
            viewModel.loadCharacters()
        }
    }

}
