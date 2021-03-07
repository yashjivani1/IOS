//
//  ViewController.swift
//  BottomSheetDemo
//
//  Created by Yash on 25/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import FittedSheets

class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
   

    @IBAction func btnTapped(_ sender: Any) {
        let vc = BottomSheetViewController()
                     
        
        let sheetController = SheetViewController(controller: vc, sizes: [.fixed(view.frame.height/5), .fixed(view.frame.height/2),.fullscreen])
      
        self.present(sheetController , animated: false, completion: nil)
        
    }
    
    @IBAction func actionSheet(_ sender: Any) {
        let alertController =  UIAlertController(title: nil, message: "Select button 1 or 2", preferredStyle: .actionSheet)
                    
                    let action1 = UIAlertAction(title: "Delete", style: .destructive) { (_) in
                        print("cancel")
                    }
                    
                    let action2 = UIAlertAction(title: "Save", style: .default) { (_) in
                        print("Save")
                    }
                    
                    
                   
                   
                    alertController.addAction(action1)
                    alertController.addAction(action2)
               
        self.present(alertController, animated: true, completion: nil)
    }
    
}

