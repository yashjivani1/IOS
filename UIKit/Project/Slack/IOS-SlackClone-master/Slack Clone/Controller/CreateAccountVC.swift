//
//  CreateAccountVC.swift
//  Slack Clone
//
//  Created by Haco on 18/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    var username = ""
    var email = ""
    var pass = ""
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        usernameTxt.text = username
        emailTxt.text = email
        passTxt.text = pass
       setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDataService.instance.avatarName != ""{
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil{
                userImg.backgroundColor = UIColor.lightGray
            }
        }

    }
    
    @IBAction func usernameChanged(_ sender: Any) {
        username = usernameTxt.text ?? ""
    }
    
   
    @IBAction func pickAvatarPressed(_ sender: Any) {
      
        self.username = usernameTxt.text!
        self.email = emailTxt.text!
        self.pass = passTxt.text!
        
        //let avatar = AvatarPickerView()
        
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if(segue.identifier == TO_AVATAR_PICKER){
                let avatar = segue.destination as! AvatarPickerView
            
            avatar.email = self.email
            avatar.username = self.username
            avatar.pass = self.pass
            
        }
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r), \(g), \(b), 1]"
        self.userImg.backgroundColor = bgColor
    }
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if(success) {
                AuthService.instance.loginUser(email: email, password: pass) { (success) in
                    if success{
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { (success) in
                            if success {
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        }
                    }
                }
            }
        } 
    }
    
    func setupView(){
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: smackePurplePlaceholder])
        
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: smackePurplePlaceholder])
        
        passTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: smackePurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap1))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap1(){
        view.endEditing(true)
    }
    
    
}
