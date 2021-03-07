//
//  LoginVC.swift
//  Slack Clone
//
//  Created by Haco on 18/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    

    @IBAction func closedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        guard let email = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let pass = passwordTxt.text, passwordTxt.text != "" else { return }
        print(email)
        print(pass)
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail { (success) in
                    NotificationCenter.default.post(name : NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView(){
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: smackePurplePlaceholder])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: smackePurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap1))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap1(){
        view.endEditing(true)
    }
}
