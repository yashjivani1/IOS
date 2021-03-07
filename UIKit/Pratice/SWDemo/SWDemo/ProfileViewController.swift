//
//  ViewController.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var menuBtn: UIBarButtonItem!
    
    //MARK:- Variables
    var profileimage1 = UIImage()
    
    var userDefault = UserDefaults.standard
    
    //MARK:- LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        tableView.register(ProfileImageTableViewCell.nib(), forCellReuseIdentifier: "ProfileImageTableViewCell")
        tableView.register(SimpleTableViewCell.nib(), forCellReuseIdentifier: "SimpleTableViewCell")
        
        tableView.register(StackTextFieldTableViewCell.nib(), forCellReuseIdentifier: "StackTextFieldTableViewCell")
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: "ButtonTableViewCell")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
}

//MARK:- TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell", for: indexPath) as! ProfileImageTableViewCell
            //            cell.delegate = self
            //cell.editBtn.addTarget(self, action: #selector(didTapEdit), for: .touchUpInside)
            //cell.profileImg.image = profileimage1
            
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
            print("username")
            cell.txtField.text =  "username"
            
            return cell
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as! SimpleTableViewCell
            
            cell.txtField.text =  "password"
            return cell
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StackTextFieldTableViewCell", for: indexPath) as! StackTextFieldTableViewCell
            
            return cell
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
            cell.btn!.backgroundColor = .blue
            //cell.btn.addTarget(self, action: #selector(didTapLogout), for: .touchUpInside)
            return cell
        default:
            let cell = UITableViewCell()
            cell.contentView.backgroundColor = .secondarySystemBackground
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 270
        default:
            return 60
        }
    }
    
//    @objc func didTapLogout(){
//        userDefault.set(false, forKey: "LogIn")
//
//        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "loginVC") as! LoginViewController
//        let nav = UINavigationController(rootViewController: loginVC)
//        self.view.window?.rootViewController = nav
//        self.view.window?.makeKeyAndVisible()
//
//        //self.navigationController!.popToRootViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
//    }
    
}

//MARK:- Image Picker Delegate Method
extension ViewController: ImagePicker,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @objc func didTapEdit() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker,animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        
//        let pickedImage = info[.originalImage]
//        self.profileimage1 = pickedImage as! UIImage
//        self.tableView.reloadData()
//        self.dismiss(animated: true, completion: nil)
//    }
    
}
