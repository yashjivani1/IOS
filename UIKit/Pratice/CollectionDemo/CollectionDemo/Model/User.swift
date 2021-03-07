//
//  User.swift
//  CollectionDemo
//
//  Created by Yash on 20/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct User{
    var id: Int
    var title: String
    var comments: [String]?
    
    static func getPosts(completionHandler: @escaping ([User]) -> Void){
        var users = [User]()
        
        let request = AF.request("https://jsonplaceholder.typicode.com/posts")
        
        request.responseData{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSON(data: data)
                    
                    for user in json.arrayValue{
                        
                        
                            users.append(User(id: user["id"].int!, title: user["title"].string!,comments: nil))
                        
                        
                    }
                    completionHandler(users)
                }catch{
                    print("Cannot parse data")
                }
            case .failure:
                print("Cannot parse data")
            }
        }
        
    }
    
    static func getData(postId: String,completionHandler: @escaping ([String]) -> Void){
        
        
        let request = AF.request("https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
        var comments = [String]()
        request.responseData{ response in
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSON(data: data)
                    comments = json.arrayValue.compactMap{ $0["body"].string }
                    
                    completionHandler(comments)
                }catch{
                    print("Cannot parse data")
                }
            case .failure(_):
                print("cant get api")
            }
            
        }
        
        
        
        
    }
    
}

