//
//  ProfileDetailViewMode.swift
//  MVVMDemo
//
//  Created by Yash on 15/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ProfileDetailViewModel{
    static var profiles = [ProfileDetails]()
    
    static func getProfiles(completionHandler: @escaping ([ProfileDetails]) -> Void){
        let request = AF.request("https://jsonplaceholder.typicode.com/photos")
        
        request.responseData { response in
            switch response.result{
            case .success(let json):
                do{
                    //print(json)
                    let json = try JSON(data: json)
                    for profile in json.arrayValue{
                        //print(profile)
                        profiles.append(ProfileDetails(id: profile["id"].int!, title: profile["title"].string!, url: profile["url"].url!))
                    }
                    completionHandler(profiles)
                }catch{
                    print("Cannot parse response")
                }
                
            case .failure:
                print("Error Did'nt get response")
            }
        }
    }
}
