//
//  ViewController.swift
//  Circle Progress Bar
//
//  Created by haco on 16/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))

    }
    
    @objc private func handleTap(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }


}

