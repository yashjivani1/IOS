//
//  HomeController.swift
//  SideMenu
//
//  Created by haco on 20/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Side Menu"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify")?.withTintColor(.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
    
}
