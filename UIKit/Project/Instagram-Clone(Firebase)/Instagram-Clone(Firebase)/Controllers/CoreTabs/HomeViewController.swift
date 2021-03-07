//
//  ViewController.swift
//  Instagram-Clone(Firebase)
//
//  Created by haco on 07/11/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       handleNotAuthenticated()
        
//        do{
//            try FirebaseAuth.Auth.auth().signOut()
//        }catch{
//            print("Failed to signout")
//        }
    }

    private func handleNotAuthenticated(){
        if Auth.auth().currentUser == nil{
                   
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
            
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
        
        return cell
    }
}
