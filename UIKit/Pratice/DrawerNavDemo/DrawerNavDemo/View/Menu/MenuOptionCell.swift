//
//  MenuOptionCell.swift
//  SWDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    //MARK:-Outlets
    @IBOutlet var menuOptionIcon: UIImageView!
    @IBOutlet var menuOptionTitle: UILabel!
    
    //MARK:- Cell Identifier
    static let identifier = "MenuOptionCell"
    
    //MARK:- Nib Register Method
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
