//
//  HomeController.swift
//  Drawer Navigation
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class HomeController: UIViewController{
    
    var delegate: HomeControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    func configureNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .darkGray
        self.navigationController?.navigationBar.barStyle = .black
        
        self.navigationItem.title = "Side Menu"
        
        setUpLeftBarButton()
        
    }
    
    func setUpLeftBarButton(){
        let image = #imageLiteral(resourceName: "Menu")
        let menu = UIButton(type: .custom)
        menu.setImage(image, for: .normal)
        menu.addTarget(self, action: #selector(handleMenuToggle), for: .touchUpInside)
        let bar = UIBarButtonItem(customView: menu)
        bar.customView?.translatesAutoresizingMaskIntoConstraints = false
        bar.customView?.heightAnchor.constraint(equalToConstant: (self.navigationController?.navigationBar.frame.height)!).isActive = true
        bar.customView?.widthAnchor.constraint(equalToConstant: (self.navigationController?.navigationBar.frame.height)!).isActive = true
        
        self.navigationItem.leftBarButtonItem = bar
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle(forMenuOption: 0)
    }
}
