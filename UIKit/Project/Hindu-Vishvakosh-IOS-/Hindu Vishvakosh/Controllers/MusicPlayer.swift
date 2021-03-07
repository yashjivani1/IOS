//
//  MusicPlayer.swift
//  Hindu Vishvakosh
//
//  Created by haco on 13/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayer: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    
    var artist : String!
    var music_name: String!
    var music_url: String!
    
    var player : AVPlayer = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = music_name
        artistLbl.text = artist
        
        let url = URL.init(string: music_url)!
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        
        player = AVPlayer(playerItem: playerItem)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        player.play()
        
        
    }
    


}
