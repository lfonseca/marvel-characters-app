//
//  CharacterDetailsViewController.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 17/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterDetailsTableView: UITableView!
    
    var viewModel: CharacterDetailsBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title
        characterImageView.kf.setImage(with: viewModel?.imageURL)
        characterDetailsTableView.dataSource = self
    }

}

extension CharacterDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
