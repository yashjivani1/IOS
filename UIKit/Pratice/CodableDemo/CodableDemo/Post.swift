//
//  Users.swift
//  CodableDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    static func getData(url: String, completionHandler: @escaping ([Post]) -> Void){
        let session = URLSession.shared
        let url = URL(string: url)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
           
            do{
                let json = try JSONDecoder().decode([Post].self, from: data!)
                print(json)
            }catch{
                print("Cant not parse json")
            }
        }
        
        task.resume()
    }
}
