//
//  HomeViewController1.swift
//  DrawerNavDemo
//
//  Created by Yash on 23/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- Variables
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    

  //MARK:- Setup TableView Method
  func setupTableView(){
      view.addSubview(tableView)
      tableView.dataSource = self
      tableView.delegate = self
      tableView.separatorStyle = .none
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      
      tableView.register(SingleCourseTableViewCell.self, forCellReuseIdentifier: SingleCourseTableViewCell.identifier)
      tableView.register(ZoomCourseTableViewCell.self, forCellReuseIdentifier: ZoomCourseTableViewCell.identifier)
  }


}

//MARK:- TableView Delegate Methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SingleCourseTableViewCell.identifier, for: indexPath) as! SingleCourseTableViewCell
            return cell
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: ZoomCourseTableViewCell.identifier, for: indexPath) as! ZoomCourseTableViewCell
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
                    case (.regular, .regular):
                      return 250
                        
                    case (.compact, .compact):
                      return 150
                        
                    case (.regular, .compact):
                       return 250
                        
                    case (.compact, .regular):
                       return 250
            
                     default: return 150
                    }
    }
}
