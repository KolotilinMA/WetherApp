//
//  addGroupTableViewCell.swift
//  WetherApp
//
//  Created by Михаил on 02/02/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

class addGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var addGroupNameLabel: UILabel?
    
    func setGroup(mygroup: myGroup) {
        self.addGroupNameLabel?.text = mygroup.name
    }
}
