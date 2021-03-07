//
//  ContainerController.swift
//  Drawer Navigation
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    var menuArray = [MenuOption]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureHomeController(){
        let homeController = HomeController()
        centerController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController(){
        if menuController == nil{
            menuController = MenuController()
            menuController.navigate = self.navigationController
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: Int){
        if shouldExpand{
            UIView.animate(withDuration: 0.3, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
               self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
             UIView.animate(withDuration: 0.3, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
             }, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
               self.centerController.view.frame.origin.x = 0
            }){(_) in
                 self.didSelectMenuOption(menuOption: menuOption)
            }
           
        }
    }
    
    func didSelectMenuOption(menuOption: Int){
        print(menuOption)
        switch menuOption{
        case 1:
            let vc = SettingViewController()
            present(UINavigationController(rootViewController: vc),animated: true)
        default:
            break
        }
    }
}

extension ContainerController: HomeControllerDelegate{

    
    func handleMenuToggle(forMenuOption menuOption: Int) {
          if !isExpanded{
                        configureMenuController()
                    }
              isExpanded = !isExpanded
       
            animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
        
       
    }
    
    
    
   
}
