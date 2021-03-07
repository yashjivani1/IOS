//
//  TitleTableViewCell.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    //MARK:- NIB register Name and Method
    static let identifier = "TitleTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet var titleImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
