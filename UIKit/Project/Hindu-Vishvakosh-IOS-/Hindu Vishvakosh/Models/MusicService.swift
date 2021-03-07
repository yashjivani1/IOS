//
//  Music.swift
//  Hindu Vishvakosh
//
//  Created by haco on 20/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MusicService{
    static var musics = [Music]()
    static func getAllMusic(){
        
        print(URL_ALL_MUSIC)
        AF.request(URL_ALL_MUSIC, method : .get, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            
            guard let data = response.data else { return }
            
            do {
                let json = try JSON(data : data)
                
                for x in json.arrayValue {
                    let demo = Music(artist: x["artist"].stringValue, location: x["location"].stringValue, music_id: x["music_id"].stringValue, music_name: x["music_name"].stringValue)
                    
                   // print(demo)
                    musics.append(demo)
                }
                NotificationCenter.default.post(name: Notification.Name("reloadTable"), object: nil)
                print(musics as Any)
            }catch{
                print(error)
            }
            
        }
    }
    
    static func searchMusic(musicString : String){
        print("\(URL_ALL_MUSIC)/search/\(musicString)")
        AF.request("\(URL_ALL_MUSIC)/search/\(musicString)", method: .get, encoding:  JSONEncoding.default, headers:  HEADERS).responseJSON { (response) in
            
            guard let data = response.data else { return }
            musics.removeAll()
            do {
                let json = try JSON(data : data)
                
                for x in json.arrayValue{
                     let demo = Music(artist: x["artist"].stringValue, location: x["location"].stringValue, music_id: x["music_id"].stringValue, music_name: x["music_name"].stringValue)
                                       
                                      // print(demo)
                                       musics.append(demo)
                }
                NotificationCenter.default.post(name: Notification.Name("reloadTable"), object: nil)
                    print(musics as Any)
                }catch{
                    print(error)
                }
                
            }
        }
    }
    
    
    

