//
//  CollectionViewController.swift
//  ImplementingViewController
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class CustomCollection: UIViewController {

    
    let layout = UICollectionViewFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.scrollDirection = .vertical
        let collection =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        view.addSubview(collection)
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collection.dataSource = self
        collection.delegate = self
        collection.register(CustomCell.nib(), forCellWithReuseIdentifier: CustomCell.identifier)
    }

}

extension CustomCollection : UICollectionViewDelegate, UICollectionViewDataSource{
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              return 5
          }
          
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
              return cell
          }
}

