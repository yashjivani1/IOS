//
//  AvatarPickerView.swift
//  Slack Clone
//
//  Created by haco on 24/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class AvatarPickerView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var avatarType = AvatarType.dark
    var username : String!
    var email : String!
    var pass : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
   
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0{
            avatarType = .dark
        }else{
            avatarType = .light
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell{
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        var numOfColumns : CGFloat = 3
//        if UIScreen.main.bounds.width > 320{
//            numOfColumns = 4
//        }
//        
//        let spaceBetweenCells : CGFloat = 10
//        let padding : CGFloat = 40
//        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
//        return CGSize(width: cellDimension, height: cellDimension)
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if avatarType == .dark{
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.performSegue(withIdentifier: RETURN_CREATE_ACCOUNT, sender: nil)
        
        //dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == RETURN_CREATE_ACCOUNT){
            let avatar = segue.destination as! CreateAccountVC
            avatar.username = self.username
            avatar.email = email
            avatar.pass = pass
        }
    }

}
