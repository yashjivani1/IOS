//
//  MusicListController.swift
//  Hindu Vishvakosh
//
//  Created by haco on 12/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class MusicListController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        MusicService.getAllMusic()
        
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name(rawValue: "reloadTable"), object: nil)
        
              
    }
    
    @objc func reload(){
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func searchMusic(_ sender: Any) {
        MusicService.searchMusic(musicString: searchTxt.text!)
    }
    
    @IBAction func favouriteBtnClicked(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MusicService.musics.count
        
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customeMusicList") as! MusicListCell
        cell.artistLbl.text = MusicService.musics[indexPath.row].artist
        cell.titleLbl.text = MusicService.musics[indexPath.row].music_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let music = self.storyboard?.instantiateViewController(identifier: "demo") as! MusicPlayer
        music.artist = MusicService.musics[indexPath.row].artist
        music.music_name = MusicService.musics[indexPath.row].music_name
        music.music_url = MusicService.musics[indexPath.row].location
        self.navigationController?.pushViewController(music, animated: true)
    }
}
