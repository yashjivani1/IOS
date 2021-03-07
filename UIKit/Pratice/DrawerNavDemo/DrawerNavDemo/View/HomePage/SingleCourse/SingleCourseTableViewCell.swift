//
//  SingleCourseTableViewCell.swift
//  DrawerNavDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SingleCourseTableViewCell: UITableViewCell {
    
    //MARK:- Identifier
    static let identifier = "SingleCourseTableViewCell"
    
    //MARK:- Variables
    let collection = SingleCourseCollectionView()
    
    
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
