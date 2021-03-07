//
//  ViewController.swift
//  WaterMarkUI
//
//  Created by Yash on 04/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    private let sideMenu = SideMenuNavigationController(rootViewController: UIViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        present(sideMenu, animated: true)
        
    }
    


}

