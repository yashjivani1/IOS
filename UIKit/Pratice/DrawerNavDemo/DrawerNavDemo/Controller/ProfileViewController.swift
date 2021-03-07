//
//  ProfileView.swift
//  DrawerNavDemo
//
//  Created by Yash on 21/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
   
    //MARK:- Variables
    let tableView = UITableView()
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    //MARK:- Setup TableView Method
    func setupTable(){
        view.addSubview(tableView)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        tableView.register(ProfileImageTableViewCell.nib(), forCellReuseIdentifier: "ProfileImageTableViewCell")
        tableView.register(SimpleTableViewCell.nib(), forCellReuseIdentifier: "SimpleTableViewCell")
        
        tableView.register(StackTextFieldTableViewCell.nib(), forCellReuseIdentifier: "StackTextFieldTableViewCell")
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: "ButtonTableViewCell")
    }
}


//MARK:- TableView Delegate Methods
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell", for: indexPath) as! ProfileImageTableViewCell
            
            //            cell.delegate = self
//            cell.editBtn.addTarget(self, action: #selector(didTapEdit), for: .touchUpInside)
            cell.profileImg.backgroundColor = .red

            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
            
            cell.txtField.text = "Hi"
            
            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
            
            cell.txtField.text = "Hi"
            return cell
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StackTextFieldTableViewCell", for: indexPath) as! StackTextFieldTableViewCell
            
            return cell
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
            cell.btn!.backgroundColor = .blue
            cell.btn.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
            return cell
        default:
            let cell = UITableViewCell()
            cell.contentView.backgroundColor = .secondarySystemBackground
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular{
            switch indexPath.row {
            case 0:
                
                return 400
            default:
                return 60
            }
        }else{
            switch indexPath.row {
            case 0:
                return 270
            default:
                return 60
            }
        }
        
    }
    
    @objc func didTapLogout(){
       
//        userDefault.set(false, forKey: "LogIn")
//
//        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "loginVC") as! LoginViewController
//        let nav = UINavigationController(rootViewController: loginVC)
//        self.view.window?.rootViewController = nav
//        self.view.window?.makeKeyAndVisible()
//
//        //self.navigationController!.popToRootViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
}
