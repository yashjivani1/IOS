//
//  NotificationViewController.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//MARK:- TableView Delegate Methods
extension NotificationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
