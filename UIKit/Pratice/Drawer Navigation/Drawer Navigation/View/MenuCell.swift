//
//  MenuOptionTableViewCell.swift
//  Drawer Navigation
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    static let identifier = "MenuCell"
    
    var iconImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.backgroundColor = .black
        
        return img
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkGray
        addSubview(iconImageView)
        addSubview(label)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
               iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
                      iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant:  12).isActive = true
                      iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
                      iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
               
               label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
               label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 25).isActive = true
        setUpCell()
        
        
    }
    
    func setUpCell(){
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
