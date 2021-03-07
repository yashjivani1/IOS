//
//  ProfileTextFieldTableViewCell.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class ProfileTextFieldTableViewCell: UITableViewCell {

    //MARK:- NIB register Name and Method
    static let identifier = "ProfileTextFieldTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var title: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
