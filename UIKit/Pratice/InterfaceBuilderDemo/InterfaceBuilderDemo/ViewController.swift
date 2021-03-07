//
//  ViewController.swift
//  InterfaceBuilderDemo
//
//  Created by Yash on 16/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as? ProfileTableViewCell
        cell?.profileImg.image = #imageLiteral(resourceName: "insta")
        return cell!
    }
    

    @IBOutlet weak var tblVIEW: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "ProfileTableViewCell",
                            bundle: nil)
        self.tblVIEW.register(cell,
                                forCellReuseIdentifier: "ProfileTableViewCell")
        self.tblVIEW.reloadData()
        // Do any additional setup after loading the view.
    }


}


