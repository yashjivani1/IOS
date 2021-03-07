//
//  StackTextFieldTableViewCell.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class StackTextFieldTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var txt1Field: UITextField?
    @IBOutlet weak var txt2Field: UITextField?
    @IBOutlet weak var txt3Field: UITextField!
    
    //MARK:- Cell Identifier
    static var identifier = "StackTextFieldTableViewCell"
    
    //MARK:- Nib Setup Method
     static func nib() -> UINib{
         return UINib(nibName: "StackTextFieldTableViewCell", bundle: nil)
     }

    //MARK:- LifeCycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
       contentView.backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
