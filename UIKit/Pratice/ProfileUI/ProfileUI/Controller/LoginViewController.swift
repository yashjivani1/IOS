//
//  LoginViewController.swift
//  ProfileUI
//
//  Created by Yash on 18/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:- Variable
    let user = LoginAuth(username: "yash", password: "yash")
    let userdefault = UserDefaults.standard
    
    //MARK:- Outlets
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
  
    
    //MARK:- Button Click Methods
    @IBAction func loginBtnClicked(_ sender: Any) {
        
        let loginCred = (username: user.username, password: user.password)
        switch loginCred {
        case (userNameTxtField.text, passwordTxtField.text) where userNameTxtField.text == user.username && passwordTxtField.text == user.password :
            userdefault.set(true,forKey: "LogIn")
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! ViewController
            //let vc = ViewController()
            
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.navigationController?.pushViewController(vc, animated: true)
            
            userdefault.set(userNameTxtField.text!, forKey: "username")
            userdefault.set(passwordTxtField.text!, forKey: "password")
            userNameTxtField.text = ""
            
            passwordTxtField.text = ""
            
            //vc.modalPresentationStyle = .fullScreen
            //self.present(vc, animated: false, completion: nil)
            
    
            //        case (userNameTxtField.text, passwordTxtField.text) where userNameTxtField.text == userName && passwordTxtField.text != password :
            //            print("Password Incorrect")
            //            break;
            //
            //        case (userNameTxtField.text, passwordTxtField.text) where userNameTxtField.text != userName && passwordTxtField.text == password :
            //            print("Username Incorrect")
            //            break;
            
        default:
            print("Invalid Username and password")
            break;
        }
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
