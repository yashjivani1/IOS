//
//  ZoomCourseCollectionView.swift
//  DrawerNavDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ZoomCourseCollectionView: UIView {
    
    //MARK:- LifeCycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup TableView
    func setUpCollectionView(){
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        self.addSubview(cv)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cv.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cv.register(ZoomCourseCollectionViewCell.nib(), forCellWithReuseIdentifier: ZoomCourseCollectionViewCell.identifier)
    }
    
}

//MARK:- CollectionView and CollectionLayout Delegate Methods
extension ZoomCourseCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZoomCourseCollectionViewCell.identifier, for: indexPath) as! ZoomCourseCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
            switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
            case (.regular, .regular):
                print("erf")
                return CGSize(width: (self.frame.size.width/3), height: self.frame.size.height)
                
            case (.regular, .compact):
                print("erf")
                return CGSize(width: (self.frame.size.width/6), height: self.frame.size.height)
            
                
            case (.compact, .regular):
                return CGSize(width: (self.frame.size.width/3), height: self.frame.size.height)
                
            default: return CGSize(width: (self.frame.size.width/1.5), height: self.frame.size.height)
            }
        
    }
}



