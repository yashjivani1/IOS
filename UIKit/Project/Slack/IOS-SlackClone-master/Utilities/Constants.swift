//
//  Constants.swift
//  Slack Clone
//
//  Created by Haco on 18/05/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import Foundation
import Alamofire

typealias CompletionHandler = (_ Success: Bool) -> ()

let BASE_URL = "https://slack-clonehaco.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"

let smackePurplePlaceholder = #colorLiteral(red: 0.08168795554, green: 0.4336717916, blue: 0.8286703609, alpha: 0.5)

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"
let RETURN_CREATE_ACCOUNT = "returnToCreateAccount"

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


let HEADERS : HTTPHeaders = [
          "Content-Type" : "application/json; charset=utf-8"
      ]

let BEARER_HEADER : HTTPHeaders = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
