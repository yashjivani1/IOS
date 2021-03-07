//
//  AuthService.swift
//  Slack Clone
//
//  Created by haco on 23/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService{
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool{
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String{
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email : String, password : String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
       
        let body: [String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default ,headers: HEADERS).responseString  { response in
            if response.error == nil{
               completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
        
    }
    
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let body : [String : Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            if response.error == nil{
                
                guard let data = response.data else {return}
                do {
                    let json = try JSON(data: data)
                   self.userEmail = json["user"].stringValue
                   self.authToken = json["token"].stringValue
                } catch {
                   print(error)
                }
                
                self.isLoggedIn = true
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
            
        }
        
    }
    
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name" : name,
            "email" : lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
       
        
        AF.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.error == nil{
                guard let data = response.data else { return }
                self.setUserInfo(data: data)
                completion(true)
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    func findUserByEmail(completion : @escaping CompletionHandler){
        AF.request("\(URL_USER_BY_EMAIL)\(userEmail)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            
            if response.error == nil{
                guard let data = response.data else { return }
                do{
                    let json = try JSON(data: data)
                    let id = json["_id"].stringValue
                    let color = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let email = json["email"].stringValue
                    let name = json["name"].stringValue
                    
                    UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                    
                }catch{
                    print(error)
                }
                
                completion(true)
            }else{
                completion(false)
                print("email")
                debugPrint(response.error?.localizedDescription as Any)
            }
            
        }
    }
    
    func setUserInfo(data: Data){
        do{
            let json = try JSON(data: data)
            let id = json["_id"].stringValue
            let color = json["avatarColor"].stringValue
            let avatarName = json["avatarName"].stringValue
            let email = json["email"].stringValue
            let name = json["name"].stringValue
            
            UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
            
        }catch{
            print(error)
        }
        
    }
    
    
    
}
