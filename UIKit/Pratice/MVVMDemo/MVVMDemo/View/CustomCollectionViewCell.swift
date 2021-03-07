//
//  CustomCollectionViewCell.swift
//  MVVMDemo
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    let image = UIImageView()
    let id = UILabel()
    let title = UILabel()
    
    //MARK:- LifeCycle Method
    override func awakeFromNib() {
       super.awakeFromNib()
       setUpCellLayout()
    }
    
   
    
    
    //MARK:- Methods to setup Layouts
    func setUpCellLayout(){
        image.translatesAutoresizingMaskIntoConstraints = false
        id.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(id)
        contentView.addSubview(title)
        image.backgroundColor = .blue
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        id.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        id.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        id.text = "1"
        
        
        title.topAnchor.constraint(equalTo: id.bottomAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        title.text = "hi"
    }
}
