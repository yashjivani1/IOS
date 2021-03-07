//
//  Data.swift
//  DesignCode2
//
//  Created by haco on 16/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable{
    let id = UUID()
    var title: String
    var body: String
}

class Api{
    func getPosts(completion: @escaping ([Post]) -> ()){
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
