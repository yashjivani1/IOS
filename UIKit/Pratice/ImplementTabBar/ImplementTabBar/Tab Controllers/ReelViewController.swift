//
//  CameraViewController.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ReelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.frame
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        
        //        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        collectionView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.register(ReelCollectionViewCell.nib(), forCellWithReuseIdentifier: ReelCollectionViewCell.identifier)
    }
}


//MARK:- CollectionView Delegate Methods
extension ReelViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelCollectionViewCell.identifier, for: indexPath) as! ReelCollectionViewCell
        //let path = Bundle.main.path(forResource: "demo", ofType:"mp4")
        cell.addPlayer()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
