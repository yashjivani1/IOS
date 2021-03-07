//
//  ViewController.swift
//  Audio Player
//
//  Created by haco on 16/10/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }

    func configureSongs(){
        songs.append(Song(name: "Viva3", albumName: "123", artistName: "haco", imageName: "3", trackName: "song1"))
        
        
        songs.append(Song(name: "Viva2", albumName: "123", artistName: "haco", imageName: "2", trackName: "song1"))
        
        songs.append(Song(name: "Viva1", albumName: "123", artistName: "haco", imageName: "1", trackName: "song1"))
        
        songs.append(Song(name: "Viva3", albumName: "123", artistName: "haco", imageName: "3", trackName: "song1"))
        
        
        songs.append(Song(name: "Viva2", albumName: "123", artistName: "haco", imageName: "2", trackName: "song1"))
        
        songs.append(Song(name: "Viva1", albumName: "123", artistName: "haco", imageName: "1", trackName: "song1"))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        if #available(iOS 13.0, *) {
            guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
                return
            }
        } else {
            // Fallback on earlier versions
        }
        
        vc.songs = songs
        vc.position = position
        
        
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}
struct Song{
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

