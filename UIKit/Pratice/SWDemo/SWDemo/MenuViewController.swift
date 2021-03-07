//
//  MenuViewController.swift
//  SWDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.register(MenuOptionCell.nib(), forCellReuseIdentifier: MenuOptionCell.identifier)
    }
    


}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! MenuOptionCell
        cell.menuOptionTitle.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealVC:SWRevealViewController = self.revealViewController()
        let profileVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileVC") as! ProfileViewController
        let nc = UINavigationController.init(rootViewController: profileVC)
        revealVC.pushFrontViewController(nc, animated: true)
    }
    
}
