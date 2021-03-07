//
//  ViewController.swift
//  DataHandling
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    @IBOutlet var usernameTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var numberTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    var profile : ProfileModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification), name: Notification.Name("profile"), object: profile)
    }
    
    @objc func didGetNotification(_ notification: Notification){
        profile = notification.object as? ProfileModel
        usernameTxtField.text = profile.username
        emailTxtField.text = profile.email
        numberTxtField.text = profile.phone
        passwordTxtField.text = profile.password
    }

    @IBAction func submitBtnTapped(_ sender: Any) {
        let profile = ProfileModel(username: usernameTxtField.text!, email: emailTxtField.text!, phone: numberTxtField.text!, password: passwordTxtField.text!)
        
        let vc = storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondViewController
        vc!.profile = profile
        //vc?.delegate = self
        vc?.modalPresentationStyle = .fullScreen
//        vc!.completion = { profile in
//            self.usernameTxtField.text = profile.username
//            self.emailTxtField.text = profile.email
//            self.numberTxtField.text = profile.phone
//            self.passwordTxtField.text = profile.password
//            print("Done")
//        }
        self.present(vc!, animated: true)
        //let vc = SecondViewController()
        
        
    }
    
    
    
}

extension FirstViewController: SecondViewControllerDelegate{
    func pass(profile: ProfileModel) {
        self.usernameTxtField.text = profile.username
        self.emailTxtField.text = profile.email
        self.numberTxtField.text = profile.phone
        self.passwordTxtField.text = profile.password
    }
}

