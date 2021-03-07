//
//  CornerRadiusButton.swift
//  InterfaceBuilderDemo
//
//  Created by Yash on 16/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRadiusButton: UIButton {
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
