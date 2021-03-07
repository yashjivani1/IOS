//
//  DataStore.swift
//  DesignCode2
//
//  Created by haco on 16/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject{
    @Published var posts: [Post] = []
    
    init(){
        getPosts()
    }
    func getPosts(){
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
