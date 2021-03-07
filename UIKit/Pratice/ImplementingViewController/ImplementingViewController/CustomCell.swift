//
//  CustomCell.swift
//  ImplementingViewController
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {

    static let identifier = "CustomCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
    }

}
