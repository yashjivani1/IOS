//
//  ToastView.swift
//  ToastDemo
//
//  Created by Yash on 25/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ToastView: UIView {

    let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.text = "Toast Button clicked"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
