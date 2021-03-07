//
//  MyCoursesViewController.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class MyCoursesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCoursesTableViewCell.nib(), forCellReuseIdentifier: MyCoursesTableViewCell.identifier)
    }
}

//MARK:- UITableView Delegate and DataSource Methods
extension MyCoursesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCoursesTableViewCell.identifier) as! MyCoursesTableViewCell
        cell.coureName.text = "Ios deve"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
