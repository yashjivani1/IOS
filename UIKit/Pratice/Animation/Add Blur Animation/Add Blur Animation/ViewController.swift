//
//  ViewController.swift
//  Add Blur Animation
//
//  Created by haco on 20/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.frame = view.bounds
        createBlur()
    }
    
    func createBlur(){
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        visualEffectView.alpha = 0
        view.addSubview(visualEffectView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                visualEffectView.alpha = 1
            }
        }
    }


}

