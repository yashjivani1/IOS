//
//  MenuOptionCell.swift
//  SWDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    @IBOutlet var menuOptionIcon: UIImageView!
    @IBOutlet var menuOptionTitle: UILabel!
    
    static let identifier = "MenuOptionCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
