//
//  ViewController.swift
//  InstagramLikedAnimation
//
//  Created by haco on 14/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let likedBtn = HeartButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(likedBtn)
        likedBtn.translatesAutoresizingMaskIntoConstraints = false
        likedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        likedBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //likedBtn.frame.size = CGSize(width: 100, height: 100)
    }


}

