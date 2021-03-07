//
//  ViewController.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ContainerViewController: UITabBarController {
    
    //MARK:- LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Add Tab Method
    func addTabs(){
        let feedVC = storyboard?.instantiateViewController(identifier: "FeedViewController") as! FeedViewController
        let navigationFeedVC = UINavigationController(rootViewController: feedVC)
        
        let searchVC = storyboard?.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        let navigationSearchVC = UINavigationController(rootViewController: searchVC)
        
        let cameraVC = storyboard?.instantiateViewController(identifier: "ReelViewController") as! ReelViewController
         let navigationCameraVC = UINavigationController(rootViewController: cameraVC)
        
        let notificationVC = storyboard?.instantiateViewController(identifier: "NotificationViewController") as! NotificationViewController
        let navigationNotificationVC = UINavigationController(rootViewController: notificationVC)
        
        let profileVC = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        let navigationProfileVC = UINavigationController(rootViewController: profileVC)
        
        self.tabBar.tintColor = .black
        
        self.setViewControllers([navigationFeedVC, navigationSearchVC, navigationCameraVC, navigationNotificationVC, navigationProfileVC], animated: true)
        
        let images = ["house","magnifyingglass","plus","heart","person.crop.circle"]
        let items = self.tabBar.items
        for (index,_) in items!.enumerated(){
            items![index].image = UIImage(systemName: images[index])
           
        }
    }
}

