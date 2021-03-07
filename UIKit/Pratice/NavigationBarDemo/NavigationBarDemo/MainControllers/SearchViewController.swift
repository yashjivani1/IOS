//
//  FeedViewController.swift
//  NavigationBarDemo
//
//  Created by Yash on 25/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func searchBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
