//
//  ProfileCollectionViewCell.swift
//  ImplementTabBar
//
//  Created by Yash on 28/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlet
    @IBOutlet var postImage: UIImageView!

    //MARK:- Static identifier and Nib register method
    static let identifier = "ProfileCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARKL:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

}
