//
//  GroupTableViewCell.swift
//  WetherApp
//
//  Created by Михаил on 09/02/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var groupNameLabel: UILabel?
    
    //  Ячейка сама решает как быть с City
    func setGroup(group: myGroup) {
        
        self.groupNameLabel?.text = group.name
        
    }
}
