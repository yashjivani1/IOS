//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
 
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft" : 5, "Medium" : 7, "Hard" : 12]
    var totalTime = 0
    var secondPassed = 0
    
    var timer = Timer()
    override func viewDidLoad() {
           super.viewDidLoad()
       }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
                
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target : self, selector: #selector(updateTimer), userInfo: nil,repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime{
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageProgress)
           
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: url!)
        
        player.play()
    }
}
