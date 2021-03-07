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
    
    @IBOutlet var ProfileImgHeight: NSLayoutConstraint!
    
    @IBOutlet var ProfileImgWidth: NSLayoutConstraint!
    
    
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
        
        
        editBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: editBtn.bounds.width - editBtn.bounds.height)
        editBtn.imageView?.layer.cornerRadius = editBtn.bounds.height/2.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
            
            
        }else{
            
        }
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.regular, .regular):
            self.ProfileImgWidth.constant = 250
            self.ProfileImgHeight.constant = 250
            
        case (.compact, .compact):
            self.ProfileImgWidth.constant = 250
            self.ProfileImgHeight.constant = 250
            
        case (.regular, .compact):
            self.ProfileImgWidth.constant = 250
            self.ProfileImgHeight.constant = 250
            
        case (.compact, .regular):
            self.ProfileImgWidth.constant = 150
            self.ProfileImgHeight.constant = 150
            
        default: break
        }
        self.profileImg.layer.cornerRadius = self.ProfileImgHeight.constant / 2
    }
    
    override func draw(_ rect: CGRect) {
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


