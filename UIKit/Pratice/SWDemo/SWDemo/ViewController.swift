//
//  ViewController.swift
//  SWDemo
//
//  Created by Yash on 22/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
    }


}

