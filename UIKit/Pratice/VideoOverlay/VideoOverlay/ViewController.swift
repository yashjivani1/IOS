//
//  ViewController.swift
//  VideoOverlay
//
//  Created by Yash on 03/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftGifOrigin

class ViewController: UIViewController {

    @IBOutlet var textView: UIView!
    @IBOutlet var playerView: UIView!
    @IBOutlet var textLabel: MarqueeLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "demo", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        playerView.layer.addSublayer(layer)
        let text = CATextLayer()
        text.string = "Hi"
        text.frame = view.bounds
        
        
        playerView.layer.addSublayer(text)
        player.volume = 0

//        videoOutput(videoAsset: AVAsset(url: URL(fileURLWithPath: Bundle.main.path(forResource: "demo", ofType: "mp4")!)), image: textLabel) { (string) in
//            print("Hi \(string)")
//        }
        player.play()

    }
    
   


}

