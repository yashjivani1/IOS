//
//  StoryTableViewCell.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    //MARK:- Static Identifier
    static let identifier = "StoryTableViewCell"
    
    //MARK:- Variables
    var collection = StoryCollectionViewController()
    
    //MARK:- LifeCycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Utility Functions
    func setUpCollection(){
        addSubview(collection.view)
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        collection.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collection.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collection.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collection.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
