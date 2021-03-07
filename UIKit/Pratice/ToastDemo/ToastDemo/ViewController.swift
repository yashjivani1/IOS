//
//  ViewController.swift
//  ToastDemo
//
//  Created by Yash on 25/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toastBtnClicked(_ sender: Any) {
        let width = view.frame.width / 1.2
        let frame = CGRect(x: (self.view.frame.size.width - width)/2, y: view.frame.height, width: view.frame.width/2 , height: 60)
        let toastView = ToastView(frame: frame)
        view.addSubview(toastView)
        
        UIView.animate(withDuration: 0.2, animations: {
            toastView.frame = CGRect(x: (self.view.frame.size.width - width)/2, y: self
                .view.frame.size.height - 100, width: width, height: 60)
        }) { (done) in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIView.animate(withDuration: 0.2, animations: {
                        toastView.frame = CGRect(x: (self.view.frame.size.width - width)/2 , y: self
                            .view.frame.size.height, width: width, height: 60)
                    }) { (finished) in
                        if finished{
                            toastView.removeFromSuperview()
                        }
                    }
                }
            }
        }
        
    }
    
}

