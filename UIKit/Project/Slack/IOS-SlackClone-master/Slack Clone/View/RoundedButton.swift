//
//  RoundedButton.swift
//  Slack Clone
//
//  Created by haco on 23/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }

}
