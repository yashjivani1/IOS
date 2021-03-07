//
//  MenuController.swift
//  Drawer Navigation
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
  
    
    
    var tableView: UITableView!
    var menuArray = [MenuOption]()
    var delegate : HomeControllerDelegate?
    var navigate : UINavigationController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        view.addSubview(tableView)
        tableView.backgroundColor = .darkGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuArray.append(MenuOption(title: "Hello", image: ""))
        menuArray.append(MenuOption(title: "Hello", image: ""))
    }
    
    func configureTableView(){
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.iconImageView.image = #imageLiteral(resourceName: "settingIcon")
        cell.label.text = menuArray[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.handleMenuToggle(forMenuOption: indexPath.row)
    }
    
}


