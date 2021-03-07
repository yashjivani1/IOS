//
//  CustomTableViewCell.swift
//  MVCDemo
//
//  Created by Yash on 13/01/21.
//  Copyright © 2021 human.solutions. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var idTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
