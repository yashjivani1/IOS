//
//  LoginController.swift
//  Hindu Vishvakosh
//
//  Created by haco on 19/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        MusicService.getAllMusic()
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        User.login(email: emailTxt.text!, password: passwordTxt.text!) { (success) in
            if success == true{
                print("Correct")
            }else{
                print("Incorrect")
            }
        }
    }
    
    

}
