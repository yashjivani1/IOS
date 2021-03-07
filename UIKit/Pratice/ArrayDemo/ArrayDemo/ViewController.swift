//
//  ViewController.swift
//  ArrayDemo
//
//  Created by Yash on 19/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:-Variables
    var users = [LoginAuth]()
    
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Button Action Methods
    @IBAction func didTapAddData(_ sender: Any) {
        let alertVC = setupAlertView(userName: "", password: "", edit: false, index: nil)
        present(alertVC,animated: true)
    }
    
    //MARK:- Utility Method
    func setupAlertView(userName: String, password: String, edit: Bool, index: Int?) -> UIAlertController{
        let alertVC = UIAlertController(title:"Please enter data", message: "Enter Username and Password", preferredStyle: UIAlertController.Style.alert)
        
        alertVC.addTextField { (textField) in
            textField.text = userName
            textField.placeholder = "Enter Username"
        }
        
        
        alertVC.addTextField { (textField) in
            textField.text = password
            textField.placeholder = "Enter Password"
        }
        if edit{
            let editAction = UIAlertAction(title: "edit", style: .default) { (_) in
                let username1 = alertVC.textFields![0].text
                let password1 = alertVC.textFields![1].text
                
                self.users[index!].username = username1!
                self.users[index!].password = password1!
                self.tableView.reloadData()
                
            }
            alertVC.addAction(editAction)
        }else{
            let add = UIAlertAction(title: "add", style: .default) { (_) in
                let username1 = alertVC.textFields![0].text
                let password1 = alertVC.textFields![1].text
                self.users.append(LoginAuth(username: username1!, password: password1!))
                self.tableView.reloadData()
            }
            alertVC.addAction(add)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        
        alertVC.addAction(cancel)
        return alertVC
        
    }
    
}



//MARK:- TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].username
        cell.detailTextLabel?.text = users[indexPath.row].password
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertVC = setupAlertView(userName: users[indexPath.row].username, password: users[indexPath.row].password, edit: true, index: indexPath.row)
        
        present(alertVC,animated: true)
    }
}

