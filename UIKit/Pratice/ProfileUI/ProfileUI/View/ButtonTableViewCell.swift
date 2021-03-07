//
//  ButtonTableViewCell.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var btn: UIButton!
    
    //MARK:- Cell Identifier
    static var identifier = "ButtonTableViewCell"
    
    //MARK:- Nib Setup Method
     static func nib() -> UINib{
         return UINib(nibName: "ButtonTableViewCell", bundle: nil)
     }
    
    //MARK:- LifeCycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        btn.layer.cornerRadius = btn.frame.height/2
        contentView.backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
