//
//  ReelCollectionViewCell.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit
import AVKit

class ReelCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Static Identifier and Nibs
    static let identifier = "ReelCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet weak var playerView: UIView!
    
    //MARK:- Variables
    var avQueuePlayer   : AVPlayer!
    var avPlayerLayer   : AVPlayerLayer!
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .green
    }
    
    //MARK:- Other Functions
    func addPlayer() {
        DispatchQueue.main.async {
            let url = Bundle.main.path(forResource: "demo", ofType: "mp4")
            let player = AVPlayer(url: URL(fileURLWithPath: url!))
            let layer = AVPlayerLayer(player: player)
            layer.frame = self.playerView.bounds
            layer.videoGravity = .resizeAspectFill
            self.playerView.layer.addSublayer(layer)
            player.volume = 0
            player.play()
        }
    }
}
