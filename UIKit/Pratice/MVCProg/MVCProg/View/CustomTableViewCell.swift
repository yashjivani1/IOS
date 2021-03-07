//
//  CustomTableViewCell.swift
//  MVCProg
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let profileImg = UIImageView()
    let idTxt = UILabel()
    let titleTxt = UILabel()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    func setupCellLayout(){
        contentView.addSubview(profileImg)
        contentView.addSubview(idTxt)
        contentView.addSubview(titleTxt)
//        profileImg.frame = CGRect(x: 20, y: 25, width: 50, height: 50)
//        idTxt.frame = CGRect(x: 150, y: 25, width: 20, height: 15)
//        titleTxt.frame = CGRect(x: 150, y: 50, width: contentView.frame.size.width, height: 15)
        
        
        //..........................................................
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        profileImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        profileImg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25).isActive = true
        profileImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        profileImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(contentView.frame.width + 20)).isActive = true
        profileImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        idTxt.translatesAutoresizingMaskIntoConstraints = false
        idTxt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        idTxt.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60).isActive = true
        idTxt.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 40).isActive = true
        
        titleTxt.translatesAutoresizingMaskIntoConstraints = false
        titleTxt.topAnchor.constraint(equalTo: idTxt.bottomAnchor, constant: 10).isActive = true
        titleTxt.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25).isActive = true
        titleTxt.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 40).isActive = true
        
        
    }
}
