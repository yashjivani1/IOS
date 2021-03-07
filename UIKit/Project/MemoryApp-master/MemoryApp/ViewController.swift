//
//  ViewController.swift
//  MemoryApp
//
//  Created by Haco on 14/03/20.
//  Copyright © 2020 Haco. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var items = [MemoryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadItems()
    }

    func loadItems(){
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json") else {
            fatalError("Unable to find JSON")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Unable to load JSON data")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        
        items = savedItems
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instantiate memory view controller.")
        }
        
        let item = items[indexPath.row]
        
        vc.item = item
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

