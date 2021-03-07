//
//  SearchViewController.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import  collection_view_layouts

class SearchViewController: UIViewController {
    
    
    
    //MARK:- Outlets
    @IBOutlet var searchBar: UISearchBar!
    
    //MARK:- Variables
    let images = [#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-7"),#imageLiteral(resourceName: "image-3"),#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-2"), #imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-7"),#imageLiteral(resourceName: "image-4"),#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-2"),#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-7"),#imageLiteral(resourceName: "image-1"),#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-2"), #imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-7"),#imageLiteral(resourceName: "image-6"),#imageLiteral(resourceName: "image-8"),#imageLiteral(resourceName: "image-5"),#imageLiteral(resourceName: "image-2")]
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
    
    //MARK:- CollectionLayout Function
    private func setupCollectionView(){
        let layout: BaseLayout = InstagramLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.register(SearchCollectionViewCell.nib(), forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
    
    static func createLayoutDiffSection() -> UICollectionViewCompositionalLayout {
        //Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
        
        //item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        //verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let VerticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)),
            subitem: verticalStackItem, count: 2)
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitem: tripletItem, count: 3)
        
        //Group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)),
            subitems: [item, VerticalStackGroup])
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(3/5)),
            subitems: [horizontalGroup, tripletHorizontalGroup])
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
}

//MARK:- CollectionView Delegate Methods
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        cell.cellImage.image = images[indexPath.item]
        return cell
    }
}

