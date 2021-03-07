//
//  StoryCell.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {

    //MARK:- Static Identifier and Nibs
    static let identifier = "StoryCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userName: UILabel!
    
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }

}
