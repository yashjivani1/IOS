//
//  ViewController.swift
//  TextFieldChangeDemo
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var firstTxt: UITextField!
    @IBOutlet var secondTxt: UITextField!
    @IBOutlet var thirdTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTxt.delegate = self
        secondTxt.delegate = self
        thirdTxt.delegate = self
        
        firstTxt.returnKeyType = UIReturnKeyType.next
        secondTxt.returnKeyType = UIReturnKeyType.next
        thirdTxt.returnKeyType = UIReturnKeyType.done
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        print("Done")
    }
    
}

extension ViewController : UITextFieldDelegate{
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstTxt:
            secondTxt.becomeFirstResponder()
        case secondTxt:
            thirdTxt.becomeFirstResponder()
            
        case thirdTxt:
            submitBtnTapped(UIButton.self)
            
        default:
            break
        }
        return false
    }
    
}

