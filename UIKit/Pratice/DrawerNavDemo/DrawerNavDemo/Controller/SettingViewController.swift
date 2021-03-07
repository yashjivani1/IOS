//
//  SettingViewController.swift
//  DrawerNavDemo
//
//  Created by Yash on 23/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    //MARK:- Outlets
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Button Action Methods
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            collectionView.backgroundColor = .blue
        case 1:
            collectionView.backgroundColor = .orange
        default:
            break
        }
    }
    
}

//MARK:- CollectionView Delegate Methods
extension SettingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "settingCell", for: indexPath)
  
        cell.layer.cornerRadius = cell.frame.height/4
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            // Customize headerView here
            return headerView
        }
        fatalError()
    }
    
}





