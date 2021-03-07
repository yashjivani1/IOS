//
//  ProfileViewController.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK:-Outlets
    @IBOutlet var tableView: UITableView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileImageTableViewCell.nib(), forCellReuseIdentifier: ProfileImageTableViewCell.identifier)
        tableView.register(ProfileTextFieldTableViewCell.nib(), forCellReuseIdentifier: ProfileTextFieldTableViewCell.identifier)
    }
    
    @IBAction func settingButtonTapped(_ sender: UIBarButtonItem) {
        let settingVC = storyboard?.instantiateViewController(identifier: "settingVC") as! SettingViewController
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier) as! ProfileImageTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTextFieldTableViewCell.identifier) as! ProfileTextFieldTableViewCell
            cell.title.text = "First Name"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTextFieldTableViewCell.identifier) as! ProfileTextFieldTableViewCell
            cell.title.text = "Last Name"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100
        default:
            return 80
        }
    }
}
