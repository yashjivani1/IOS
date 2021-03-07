//
//  FeedViewController.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(openCamera))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        registerTableCell()
    }
    
    //MARK:- Other Utility Methods
    @objc func openCamera(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController,animated: true)
    }
    
    private func registerTableCell(){
        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: StoryTableViewCell.identifier)
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: "PostTableViewCell")
        tableView.allowsSelection = false
    }
}


//MARK:- TableView delegate
extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier) as! StoryTableViewCell
            return cell
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell
            cell!.postedImg.backgroundColor = .red
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return 500
        }
    }
}

//MARK:- ImagePicker Delegate Methods
extension FeedViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
