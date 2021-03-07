//
//  ViewController.swift
//  RotationDemo
//
//  Created by Yash Jivani on 05/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(imgView.transform)
        imgView.transform = imgView.transform.rotated(by: CGFloat(Double.pi / 2))
        print(imgView.transform)
    }


}

