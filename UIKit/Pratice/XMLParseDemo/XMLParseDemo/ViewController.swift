//
//  ViewController.swift
//  XMLParseDemo
//
//  Created by Yash on 01/02/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var  rssItems: [RSSItem]?
    
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData(){
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://developer.apple.com/news/rss/news.rss") { (rssItems) in
            
          
            
                
              
            DispatchQueue.main.async {
                self.rssItems = rssItems
                //print(self.rssItems)
                print("Not Done")
                self.tableView.reloadData()
                
                print("Done")
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rssItems != nil{
            return rssItems!.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        print(rssItems![indexPath.row].title)
        cell.textLabel?.text = rssItems![indexPath.row].title
        return cell
    }
}

