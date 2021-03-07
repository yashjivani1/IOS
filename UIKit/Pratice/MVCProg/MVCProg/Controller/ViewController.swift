//
//  ViewController.swift
//  MVCProg
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    //MARK:- Variable
    var arr = [User]()
    
    let tableView = UITableView()
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpActivityIndicator()
        setupTableView()
        setUpBlurEffect()
        activityIndicator.startAnimating()
        User.getData{ users in
            self.arr = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.tableView.alpha = 1
            }
        }
    }
    
    //MARK:- Set up TableView Data source
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func setUpActivityIndicator(){
        view.addSubview(activityIndicator)
        activityIndicator.center = self.view.center
    }
    
    func setUpBlurEffect(){
        tableView.alpha = 0.5
    }
    
}

//MARK:- UITableView Delegte Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            cell.profileImg.sd_setImage(with: arr[indexPath.row].imageUrl)
            cell.idTxt.text = String(arr[indexPath.row].id)
            cell.titleTxt.text = String(arr[indexPath.row].name)
            return cell
        }
        
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
}


