//
//  ContainerController.swift
//  SideMenu
//
//  Created by haco on 20/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    override func viewDidLoad(){
        super.viewDidLoad()
        
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
       centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        if menuController == nil{
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
    func  showMenuController(shouldExpand: Bool){
        if shouldExpand{
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle() {
        if !isExpanded{
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
    
    
}
