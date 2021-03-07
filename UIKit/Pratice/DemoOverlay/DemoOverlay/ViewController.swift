//
//  ViewController.swift
//  DemoOverlay
//
//  Created by Yash on 02/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//


import UIKit
import Kitsunebi


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerView: PlayerView = PlayerView(frame: view.bounds)!
        let baseVideoURL = Bundle.main.url(forResource: "demo", withExtension: "mp4")!
        let alphaVideoURL = Bundle.main.url(forResource: "demo", withExtension: "mp4")!
        do{
            try! playerView.play(base: baseVideoURL, alpha: alphaVideoURL, fps: 30)
        }catch{
            print("Done")
        }
    }
}
