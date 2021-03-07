//
//  DatabaseManager.swift
//  Instagram-Clone(Firebase)
//
//  Created by haco on 08/11/20.
//  Copyright © 2020 haco. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager{
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username": username]){ error, _ in
            if error == nil{
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
    }
    
}
