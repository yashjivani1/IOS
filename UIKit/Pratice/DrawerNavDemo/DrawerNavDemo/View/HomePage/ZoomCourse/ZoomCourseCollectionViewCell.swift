//
//  ZoomCourseCollectionViewCell.swift
//  DrawerNavDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ZoomCourseCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet var courseIcon: UIImageView!
    @IBOutlet var courseTitle: UILabel!
    @IBOutlet var coursePrice: UILabel!
    
    @IBOutlet var courseImgLeading: NSLayoutConstraint!
    @IBOutlet var courseImgTrailing: NSLayoutConstraint!
    //MARK:- Identifier
    static let identifier = "ZoomCourseCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func layoutSubviews() {
         switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.regular, .regular):
           courseImgLeading.constant = 50
           courseImgTrailing.constant = 50
            
        case (.compact, .compact):
           courseImgLeading.constant = 10
           courseImgTrailing.constant = 10
            
        case (.regular, .compact):
           courseImgLeading.constant = 10
           courseImgTrailing.constant = 10
            
        case (.compact, .regular):
            courseImgLeading.constant = 10
            courseImgTrailing.constant = 10
         default: break
        }
    }
    
    //LifeCycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        courseIcon.layer.cornerRadius = courseIcon.frame.height / 5
    }
}
