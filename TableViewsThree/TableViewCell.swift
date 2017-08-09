//
//  TableViewCell.swift
//  TableViewsThree
//
//  Created by Jaxon Stevens on 7/12/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var viewmain: UIView!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    // viewmain.layer.borderColor = UIColor(red:0.13, green:0.76, blue:0.84, alpha:1.00).cgColor

    }

    // Custom Table View Cell Label
    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var blueTitleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
