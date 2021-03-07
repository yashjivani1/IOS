//
//  SecondCollectionViewCell.swift
//  DataHandling
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate{
    func pass(profile: ProfileModel)
}
class SecondViewController: UIViewController {
    
    var completion: ((ProfileModel) -> Void)?
    var name = ""
    var profile = ProfileModel(username: "", email: "", phone: "", password: "")
    
    @IBOutlet var usernameTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var numberTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    var delegate : SecondViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTxtField.text =  self.profile.username
           self.emailTxtField.text = self.profile.email
           self.numberTxtField.text = self.profile.phone
           self.passwordTxtField.text = self.profile.password
       
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
//        self.completion!(ProfileModel(username: self.usernameTxtField.text!, email: self.emailTxtField.text!, phone: self.numberTxtField.text!, password: self.passwordTxtField.text!))
        
//        self.delegate.pass(profile: ProfileModel(username: self.usernameTxtField.text!, email: self.emailTxtField.text!, phone: self.numberTxtField.text!, password: self.passwordTxtField.text!))
        
        NotificationCenter.default.post(name: Notification.Name("profile"), object: ProfileModel(username: self.usernameTxtField.text!, email: self.emailTxtField.text!, phone: self.numberTxtField.text!, password: self.passwordTxtField.text!))
        self.dismiss(animated: true, completion: nil)
    }
    
}


