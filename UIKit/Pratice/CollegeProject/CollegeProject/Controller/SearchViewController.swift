//
//  SearchViewController.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class SearchViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchCourseTableViewCell.nib(), forCellReuseIdentifier: SearchCourseTableViewCell.identifier)
    }
}

//MARK:- UITableView Delegate and DataSource Methods
extension SearchViewController:
    UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCourseTableViewCell.identifier) as! SearchCourseTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
