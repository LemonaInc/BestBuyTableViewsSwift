//
//  TableViewCellTwo.swift
//  TableViewsThree
//
//  Created by Jaxon Stevens on 7/12/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class TableViewCellTwo: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.borderColor = UIColor(red:0.13, green:0.76, blue:0.84, alpha:1.00).cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
