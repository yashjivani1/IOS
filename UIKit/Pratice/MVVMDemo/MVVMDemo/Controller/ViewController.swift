//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController{
    
    //MARK:- Variable
    var arr = [ProfileDetails]()
    private let spacing:CGFloat = 5
    
    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
       
        ProfileDetailViewModel.getProfiles { (profileDetails) in
            self.arr = ProfileDetailViewModel.profiles
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}



//MARK:- CollectionView Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.image.sd_setImage(with: arr[indexPath.row].url)
        cell.id.text = String(arr[indexPath.row].id)
        cell.title.text = arr[indexPath.row].title
        
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCells:CGFloat = 5

        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row

        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
}

