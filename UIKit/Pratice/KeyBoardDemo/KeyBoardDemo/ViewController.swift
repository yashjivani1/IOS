//
//  ViewController.swift
//  KeyBoardDemo
//
//  Created by Yash on 04/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    @IBOutlet var textField5: UITextField!
    @IBOutlet var textField6: UITextField!
    @IBOutlet var textField7: UITextField!
    @IBOutlet var textField8: UITextField!
    @IBOutlet var textField9: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        textField7.delegate = self
        textField8.delegate = self
        textField9.delegate = self
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textField1:
            textField2.becomeFirstResponder()
        case textField2:
            textField3.becomeFirstResponder()
        case textField3:
            textField4.becomeFirstResponder()
        case textField4:
            textField5.becomeFirstResponder()
        case textField5:
            textField6.becomeFirstResponder()
        case textField6:
            textField7.becomeFirstResponder()
        case textField7:
            textField8.becomeFirstResponder()
        case textField8:
            textField9.becomeFirstResponder()
        case textField9:
            print("2")
        default:
            break
        }
        
        return true
    }
}

