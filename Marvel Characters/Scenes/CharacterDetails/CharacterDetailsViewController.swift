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
        characterDetailsTableView.backgroundColor = UIColor(red:0.00, green:0.29, blue:0.49, alpha:1.0)
        characterDetailsTableView.tableFooterView = UIView()
        characterDetailsTableView.dataSource = self
        characterDetailsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

}

extension CharacterDetailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.title(for: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(for: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.backgroundColor = UIColor(red:0.91, green:0.95, blue:0.96, alpha:1.0)
        cell.textLabel?.textColor = UIColor(red:0.25, green:0.45, blue:0.69, alpha:1.0)
        cell.textLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 16)
        cell.textLabel?.text = viewModel?.info(for: indexPath.section, at: indexPath.row)

        return cell
    }
    
}

extension CharacterDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}
