//
//  PostTableViewCell.swift
//  ImplementTabBar
//
//  Created by Yash on 27/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //MARK:- Static Identifier and Nibs
    static let identifier = "PostTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var moreBtn: UIButton!
    @IBOutlet var postedImg: UIImageView!
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.backgroundColor = .red
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     //postedImg.backgroundColor = .red
    }
    
}
