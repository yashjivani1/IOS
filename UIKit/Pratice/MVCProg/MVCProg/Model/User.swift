//
//  User.swift
//  MVCProg
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User: Decodable{
    var imageUrl: URL
    var id: Int
    var name: String
    
   static func getData(completionHandle: @escaping([User]) -> Void){

        var user1 = [User]()
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        guard let urlTemp = url else{
            return
        }

        var request = URLRequest(url: urlTemp)
        request.httpMethod = "GET"

        _ = URLSession.shared.dataTask(with: request){ (data, _, error) in
            if let error = error{
                print("Sorry request error",error.localizedDescription)
                return
            }
            
            do{
               let json = try JSON(data: data!)
                for user in json.arrayValue{
                    let userTemp = User(imageUrl: user["url"].url!, id: user["id"].int! , name: user["title"].string!)
                    user1.append(userTemp)
                    print(userTemp)
                }
                completionHandle(user1)
            }catch{
                print("Data cannot be parsed")
            }

        }.resume()

    }
}
