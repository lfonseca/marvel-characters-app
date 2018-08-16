//
//  CharacterCell.swift
//  Marvel Characters
//
//  Created by Lucas Fonseca on 16/08/2018.
//  Copyright © 2018 Lucas Fonseca. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    static let reuseIdentifier: String = "CharacterCell"

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func prepareForReuse() {
        characterImageView.image = nil
        characterNameLabel.text = nil
    }

}
