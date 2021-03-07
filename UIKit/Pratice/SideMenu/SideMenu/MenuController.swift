//
//  MenuController.swift
//  SideMenu
//
//  Created by haco on 20/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    var tableView: UITableView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    func setUpTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MenuController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
