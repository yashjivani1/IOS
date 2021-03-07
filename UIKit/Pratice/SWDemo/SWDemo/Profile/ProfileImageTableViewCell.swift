//
//  ProfileImageTableViewCell.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

//MARK:- Protocol For ImagePicker
protocol ImagePicker {
    func didTapEdit()
}
class ProfileImageTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var editBtn: UIButton!
    
    
    var delegate: ImagePicker!
    //MARK:- Identifier
    static var identifier = "ProfileImageTableViewCell"
    
    //MARK:- Nib Setup Method
    static func nib() -> UINib!{
        return UINib(nibName: "ProfileImageTableViewCell", bundle: nil)
    }
    
    
    
    
    
    //MARK:- LifeCycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        
        editBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: editBtn.bounds.width - editBtn.bounds.height)
        editBtn.imageView?.layer.cornerRadius = editBtn.bounds.height/2.0
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
   
}


