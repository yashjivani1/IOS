//
//  ViewController.swift
//  NavigationBarDemo
//
//  Created by Yash on 25/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    @IBAction func commentDetailTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CommentVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

