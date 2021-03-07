//
//  ViewController.swift
//  CompletionHandlersDemo
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func firstBtnClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondVC") as! SecondViewController
        print("1")
        
        vc.demo { (text) in
            print("Done escaping")
        }
        self.present(vc, animated: true, completion: nil)
    }
    
}

