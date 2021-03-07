//
//  SecondViewController.swift
//  CompletionHandlersDemo
//
//  Created by Yash on 26/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var completionHandler :  ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func secondBtnClicked(_ sender: Any) {
       
    }
    func demo1(){
        print("Not Done")
               completionHandler?("Hello")
               print("Done")
    }
    
    func demo(completion: @escaping (String) -> Void){
        print("before")
        completion("escaping")
        print("after")
    }
    

}
