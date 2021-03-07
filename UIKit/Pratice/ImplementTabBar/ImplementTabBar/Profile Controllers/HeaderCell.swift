//
//  HeaderCell.swift
//  ImplementTabBar
//
//  Created by Yash on 28/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit


class HeaderCell: UICollectionReusableView {
    
    
    
    //MARK:- Outlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    //MARK:- Static identifier and Nib register method
    static let identifier = "HeaderCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
        
    }
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        segmentControl.addUnderlineForSelectedSegment()
        
    }
}


