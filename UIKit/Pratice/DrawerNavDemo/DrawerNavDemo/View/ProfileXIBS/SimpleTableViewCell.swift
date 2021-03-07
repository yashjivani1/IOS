//
//  SimpleTableViewCell.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    //Mark:- Outlets
    @IBOutlet weak var txtField: UITextField!
    
    var txtTemp : String!
    //MARK:- Cell Identifier
    static var identifier = "SimpleTableViewCell"
    
    //MARK:- Nib Setup Method
    static func nib() -> UINib{
         return UINib(nibName: "SimpleTableViewCell", bundle: nil)
     }

    //MARK:- LifeCycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        txtField.text = txtTemp
        contentView.backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
