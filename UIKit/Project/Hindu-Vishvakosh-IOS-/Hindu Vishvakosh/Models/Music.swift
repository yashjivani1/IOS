//
//  Music.swift
//  Hindu Vishvakosh
//
//  Created by haco on 20/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation

struct Music{
    public var artist : String
    public var location : String
    public var music_id : String
    public var music_name : String
    
    init(artist : String, location : String, music_id : String, music_name : String){
        self.artist = artist
        self.location = location
        self.music_id = music_id
        self.music_name = music_name
    }
}
