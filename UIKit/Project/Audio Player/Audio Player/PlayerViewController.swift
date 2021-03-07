//
//  PlayerViewController.swift
//  Audio Player
//
//  Created by haco on 16/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player : AVAudioPlayer?
    
    
    private let albumImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //imageView.translatesAutoresizingMaskIntoConstraints = true
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(songs[position].trackName)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0{
            configure()
        }
    }


  
    func configure(){
        let song = songs[position]
        
        let urlString = Bundle.main.url(forResource: song.trackName, withExtension: "mp3")
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let url = urlString else{
                print("Url string is null")
                return
            }
            
            player = try AVAudioPlayer(contentsOf: url)
            
            guard let player = player else{
                print("Player is nil")
                return
            }
            player.volume = 0.5
            
            player.play()
        }catch{
            print("error")
        }
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.width - 20, height: holder.frame.size.width - 20)
        albumImageView.image = UIImage(named: song.imageName)
       
        holder.addSubview(albumImageView)
        
        songNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10, width: holder.frame.size.width - 20, height: 70)
        albumNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 70, width: holder.frame.size.width - 20, height: 70)
        artistNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 140, width: holder.frame.size.width - 20, height: 70)
        
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        
        
        
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)
        
        
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height - 60, width: holder.frame.size.width - 40, height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
        let nextButton = UIButton()
        let backButton = UIButton()
        
        
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0, y: yPosition, width: size, height: size)
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20, y: yPosition, width: size, height: size)
        backButton.frame = CGRect(x: 20, y: yPosition, width: size, height: size)
        
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        if #available(iOS 13.0, *) {
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        
        playPauseButton.tintColor = .white
        backButton.tintColor = .white
        nextButton.tintColor = .white
        
        holder.addSubview(backButton)
        holder.addSubview(nextButton)
        holder.addSubview(playPauseButton)
        
        
    }
    
    @objc func didTapBackButton(){
        if position > 0{
            position = position - 1
            player?.stop()
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNextButton(){
        if position < (songs.count - 1){
            position = position + 1
            player?.stop()
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapPlayPauseButton(){
        if player?.isPlaying == true{
            player?.pause()
            if #available(iOS 13.0, *) {
                playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
            }
            
            UIView.animate(withDuration: 0.2) {
                self.albumImageView.frame = CGRect(x: 30, y: 30, width: self.holder.frame.size.width - 60, height: self.holder.frame.size.width - 60)
            }
        }else{
            player?.play()
            if #available(iOS 13.0, *) {
                playPauseButton.setBackgroundImage((UIImage(systemName: "pause.fill")), for: .normal)
            } else {
                // Fallback on earlier versions
            }
            
            UIView.animate(withDuration: 0.2) {
                self.albumImageView.frame = CGRect(x: 30, y: 30, width: self.holder.frame.size.width - 20, height: self.holder.frame.size.width - 20)
            }
        }
    }
    
    @objc func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        player?.volume = value
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player{
            player.stop()
        }
    }

}
