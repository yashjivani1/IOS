//
//  ViewController.swift
//  ImplementingViewController
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let table = TableViewController()
    let collection = CustomCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
    }
    
    
    func addSubView(){
       addChild(table)
       addChild(collection)
       
       view.addSubview(table.view)
       view.addSubview(collection.view)
       
       
       table.view.frame = view.bounds
       collection.view.frame = view.bounds
     
       
       table.view.isHidden =  false
       collection.view.isHidden = true
    }
    
    @IBAction func segmentValueChangeTapped(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            table.view.isHidden =  false
            collection.view.isHidden = true
            PlayerState.playerStatus = true
        case 1:
            table.view.isHidden =  true
            collection.view.isHidden = false
            
        default:
            break
        }
    }
}

