//
//  ContainerViewController.swift
//  DrawerNavDemo
//
//  Created by Yash on 23/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import SideMenu

class ContainerViewController: UIViewController {
    
  

    //MARK:- Variables
    private var sideMenu: SideMenuNavigationController?
    private let profileViewController = ProfileViewController()
    private let settingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SettingVC") as! SettingViewController
    private let homeViewController = HomeViewController()
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMenu()
    }
    
 
    //MARK:- Action Methods For Button
    @IBAction func menuBtnClicked(_ sender: Any) {
        present(sideMenu!,animated: true)
    }
    
    //MARK:- Methods to Setup Menu
    func setUpMenu(){
         let menu = MenuViewController(with: MenuItem.allCases)
         
         menu.delegate = self
         
         sideMenu = SideMenuNavigationController(rootViewController: menu)
         sideMenu?.menuWidth = 300
         sideMenu?.presentDuration = 0.3
         
         SideMenuManager.default.leftMenuNavigationController = sideMenu
         SideMenuManager.default.leftMenuNavigationController?.presentationStyle = .viewSlideOutMenuPartialIn
         SideMenuManager.default.addPanGestureToPresent(toView: view)
         addChildControllers()
         
     }
    
    private func addChildControllers(){
        
        addChild(settingViewController)
        addChild(profileViewController)
        addChild(homeViewController)
        view.addSubview(settingViewController.view)
        view.addSubview(profileViewController.view)
        view.addSubview(homeViewController.view)
        
        settingViewController.view.frame = view.bounds
        profileViewController.view.frame = view.bounds
        homeViewController.view.frame = view.bounds
        
        settingViewController.view.isHidden =  true
        profileViewController.view.isHidden = true
         homeViewController.view.isHidden = false
    }
    
}

//MARK:- MenuController Delegate Methods
extension ContainerViewController: MenuControllerDelegate{
    func didSelectMenuItem(named: MenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue
        switch named {
        case .home:
            homeViewController.view.isHidden = false
            settingViewController.view.isHidden = true
            profileViewController.view.isHidden = true
        
        case .profile:
           homeViewController.view.isHidden = true
            settingViewController.view.isHidden = true
            profileViewController.view.isHidden = false
        case .setting:
           homeViewController.view.isHidden = true
            settingViewController.view.isHidden = false
            profileViewController.view.isHidden = true
        
        }
    }
}



