//
//  Constants.swift
//  Hindu Vishvakosh
//
//  Created by haco on 17/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import Foundation
import Alamofire

typealias CompletionHandler = (_ Success : Bool) ->()

let BASE_URL = "https://god-api-v1.herokuapp.com"
let URL_CREATE = "\(BASE_URL)/create"
let URL_LOGIN = "\(BASE_URL)/login"
let URL_ALL_MUSIC = "\(BASE_URL)/music"
let URL_IMAGE_UPLOAD = "http://127.0.0.1:5000/image/upload"

let HEADERS : HTTPHeaders = [
    "Content-Type" : "application/json"
]
