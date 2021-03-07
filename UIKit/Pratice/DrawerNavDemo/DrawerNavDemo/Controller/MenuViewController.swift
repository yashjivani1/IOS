//
//  MenuViewController.swift
//  DrawerNavDemo
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: MenuItem)
}

class MenuViewController: UITableViewController {

    //MARK:- Call-Back Method
    var delegate: MenuControllerDelegate?

    //MARK:- Variables
    private let menuItems: [MenuItem]
    
    init(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARk:- LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.separatorStyle = .none
        tableView.register(MenuOptionCell.nib(), forCellReuseIdentifier: MenuOptionCell.identifier)
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "background"))
    }
    
}

//MARk:- TableView Delegate Methods
extension MenuViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! MenuOptionCell
        cell.backgroundColor = .white
        cell.menuOptionTitle.text = "1"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


