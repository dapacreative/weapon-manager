//
//  weaponTableViewCell.swift
//  Weapon Manager
//
//  Created by dan.smith on 12/18/17.
//  Copyright © 2017 dan.smith. All rights reserved.
//

import UIKit

class weaponTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
