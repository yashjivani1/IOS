//
//  ProfileImageTableViewCell.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    
    //MARK:- NIB register Name and Method
    static let identifier = "ProfileImageTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var profileImage: UIImageView!
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
