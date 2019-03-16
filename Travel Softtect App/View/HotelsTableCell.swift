//
//  TableViewCell.swift
//  Travel Softtect App
//
//  Created by Youssef on 2/25/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class HotelsTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        isOpaque = false
        backgroundView = nil

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
