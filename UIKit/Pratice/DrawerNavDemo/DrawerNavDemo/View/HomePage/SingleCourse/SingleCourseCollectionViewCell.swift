//
//  SingleCollectionViewCell.swift
//  DrawerNavDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SingleCourseCollectionViewCell: UICollectionViewCell {

    //MARK:- Outlets
    @IBOutlet var courseImage: UIImageView!

    @IBOutlet var courseImgLeading: NSLayoutConstraint!
    
    @IBOutlet var courseImgTrailing: NSLayoutConstraint!
    //MARK:- Identifier
    static let identifier = "SingleCourseCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SingleCourseCollectionViewCell", bundle: nil)
    }
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
              case (.regular, .regular):
                 courseImgLeading.constant = 20
                 courseImgTrailing.constant = 20
                  
              case (.compact, .compact):
                 courseImgLeading.constant = 10
                 courseImgTrailing.constant = 10
                  
              case (.regular, .compact):
                print("ds")
                 courseImgLeading.constant = 10
                 courseImgTrailing.constant = 70
                  
              case (.compact, .regular):
                  courseImgLeading.constant = 10
                  courseImgTrailing.constant = 10
            
               default: break
              }
    }
}
