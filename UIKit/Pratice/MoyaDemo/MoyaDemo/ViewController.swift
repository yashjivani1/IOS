//
//  ViewController.swift
//  MoyaDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    
    var users = [User]()
    var usersProvider = MoyaProvider<UserService>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersProvider.request(.readUsers) { (result) in
            switch result{
            case .success(let response):
                let json = try! JSONDecoder().decode([User].self, from: response.data)
                self.users = json
                self.tableView.reloadData()
                
            case .failure:
                fatalError("Bhoom")
            }
        }
    }
    @IBAction func addData(_ sender: Any) {
        usersProvider.request(.createUser(name: "Yash")) { (result) in
            switch result{
            case .success(let response):
               
                let newUser = try! JSONDecoder().decode(User.self, from: response.data)
                print(newUser)
                self.users.append(newUser)
                self.tableView.reloadData()
            case .failure:
                print("failed")
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            usersProvider.request(.deleteUser(id: users[indexPath.row].id)) { (result) in
                switch result{
                case .success(let response):
                   
                    print(response)
                case .failure:
                    print("fail thai gayo")
                }
            }
        default:
            break
        }
    }
}

