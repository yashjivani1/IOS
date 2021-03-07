//
//  ZoomCourseTableViewCell.swift
//  DrawerNavDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit


class ZoomCourseTableViewCell: UITableViewCell {

    //MARK:- Identifier
    static let identifier = "ZoomCourseTableViewCell"
    
    //MARK:- Variables
    let collection = ZoomCourseCollectionView()
    
    //MARK:- LifeCycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup CollectionView Method
    func setUpCollectionView(){
        addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

