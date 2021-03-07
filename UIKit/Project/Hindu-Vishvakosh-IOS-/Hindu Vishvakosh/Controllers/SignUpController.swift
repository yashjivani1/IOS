//
//  SignUpController.swift
//  Hindu Vishvakosh
//
//  Created by haco on 17/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    var gender : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectGender(_ sender: UIButton) {
        
        if sender.tag == 0{
            gender = "male"
            maleBtn.isSelected = true
            femaleBtn.isSelected = false
        }else if sender.tag == 1{
            gender = "female"
            maleBtn.isSelected = false
            femaleBtn.isSelected = true
        }
        print(gender)
        
    }
    
   
    @IBAction func signUpTapped(_ sender: Any) {
       
        User.create(email: emailTxt.text!, userName: userNameTxt.text!, gender: gender, password: passwordTxt.text!, dob: dateTxt.text!)
        print("Button clicked")
    }
    

}
