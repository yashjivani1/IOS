//
//  ViewController.swift
//  SVGDemo
//
//  Created by Yash Jivani on 26/02/21.
//

import UIKit
import SwiftSVG

class ViewController: UIViewController {

    @IBOutlet weak var iamgeVW: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let svgURL = Bundle.main.url(forResource: "Heart-Shape", withExtension: "svg")!
        _ = CALayer(SVGURL: svgURL) { [self] (svgLayer) in
            // Set the fill color
            let color = UIColor(patternImage: UIImage(named: "bg_splash")!).withAlphaComponent(0.5).cgColor
            svgLayer.fillColor = color
            // Aspect fit the layer to self.view
            svgLayer.resizeToFit(iamgeVW.bounds)
            // Add the layer to self.view's sublayers
            iamgeVW.layer.addSublayer(svgLayer)
        }
        
       
    }


}

