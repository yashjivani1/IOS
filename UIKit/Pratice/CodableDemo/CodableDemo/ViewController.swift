//
//  ViewController.swift
//  CodableDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Post.getData(url: "https://jsonplaceholder.typicode.com/posts") { (posts) in
            self.posts = posts
        }
    }


}

