//
//  User.swift
//  Hindu Vishvakosh
//
//  Created by haco on 17/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User{
    
    static var token : String  = ""
    
    static func create(email : String, userName : String, gender : String, password : String, dob : String){
        let body = [
            "dob" : dob,
            "gender" : gender,
            "password" : password,
            "email" : email,
            "user_name" : userName
        ]
        AF.request(URL_CREATE, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            if response.error == nil{
                
                guard let data = response.data else {
                    return
                }
                
                do{
                    
                    let json = try JSON(data : data)
                    print(json)
                    self.token = json["token"].stringValue
                    print(self.token)
                }catch{
                    print(error)
                }
                
            }else{
                print(response.error as Any)
            }
        }
    }
    
    static func login(email : String, password : String, completion: @escaping CompletionHandler)  {
        let body = [
            "email" : email,
            "password" : password
        ]
        var message : String? = ""
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).response{(response) in 
            
            if response.error == nil{
                
                guard let data = response.data else{
                    return
                }
                
                do{
                    let json = try JSON(data : data)
                    
                    message = json["message"].stringValue
                    if message == "right password"{
                        self.token = json["token"].stringValue
                        completion(true)
                    }else{
                        completion(false)
                    }
                     
                   
                }catch{
                    print(error)
                }
               
            }else{
                print(response.error as Any)
            }
             
        }
        
    }
}
