//
//  ViewController.swift
//  MVCDemo
//
//  Created by Yash on 13/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arr = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        User.getData{ users in
            self.arr = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.idTxt.text = String(arr[indexPath.row].id)
        cell.titleTxt.text = arr[indexPath.row].name

        //cell.profileImg.set_
        return cell
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

