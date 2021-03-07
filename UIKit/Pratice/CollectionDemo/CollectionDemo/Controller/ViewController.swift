//
//  ViewController.swift
//  CollectionDemo
//
//  Created by Yash on 20/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//
//sort, compactmap, filter
import UIKit

class ViewController: UIViewController {
    
    //MARK:- Variables
    var data = [User]()
    var filtered = [User]()
    
    //MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortbtn: UIBarButtonItem!
    
    let activityIndicator = UIActivityIndicatorView()
    
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "Search Username"
        self.sortbtn.isEnabled = false
        self.sortbtn.title = ""
        //        self.navigationItem.leftBarButtonItem = nil
        //
        setUpActivityIndicator()
        activityIndicator.startAnimating()
        
        //        User.getData { (users) in
        //            self.data = users
        //            self.filtered = users
        //            //print(users[0])
        //            DispatchQueue.main.async {
        //                self.tableView.reloadData()
        //                self.activityIndicator.stopAnimating()
        //                self.sortbtn.isEnabled = true
        //                self.sortbtn.title = "Sort"
        //            }
        //        }
        
        User.getPosts { (users) in
            let grp = DispatchGroup()
            self.data = users
            for (index,_) in self.data.enumerated(){
                grp.enter()
                User.getData(postId: String(self.data[index].id)) { (comments) in
                    self.data[index].comments = comments
                    grp.leave()
                }
                
            }
            
            grp.notify(queue: .main){
                //print("Not")
                self.filtered = self.data
                print(self.filtered[0])
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.sortbtn.isEnabled = true
                self.sortbtn.title = "Sort"
            }
        }
    }
    
    
    func setUpActivityIndicator(){
        view.addSubview(activityIndicator)
        activityIndicator.style = .large
        activityIndicator.center = view.center
        activityIndicator.backgroundColor = .white
    }
    
    @IBAction func sortBtnClicked(_ sender: Any) {
        filtered.sort{ $0.id < $1.id }
        print(filtered)
        self.tableView.reloadData()
    }
}

//MARK:- TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableCond = (filtered.count,data.count)
        switch tableCond{
        case(0,0):
            self.tableView.separatorStyle = .none
            break
        case(0,1...):
            self.setEmptyTableView()
            break
        default:
            self.restore()
            break
        }
        //        if filtered.count == 0 && data.count != 0{
        //            self.setEmptyTableView()
        //        }else if filtered.count == 0 && data.count == 0{
        //            self.tableView.separatorStyle = .none
        //        }else{
        //            self.restore()
        //        }
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filtered[indexPath.row].title
        return cell
    }
    
    func restore(){
        self.tableView.backgroundView = nil
        self.tableView.separatorStyle = .singleLine
    }
    
    func setEmptyTableView(){
        self.tableView.separatorStyle = .none
        let textLabel = UILabel()
        textLabel.text = "No result Found"
        textLabel.textAlignment = .center
        self.tableView.backgroundView = textLabel
    }
}

//MARK:- SearchBar Delegate Methods
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = []
        if searchText == ""{
            filtered = data
        }else{
            filtered = data.filter{ $0.title.lowercased().contains(searchText.lowercased())}
        }
        self.tableView.reloadData()
    }
}



