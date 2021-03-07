//
//  SearchCourseTableViewCell.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class SearchCourseTableViewCell: UITableViewCell {

    //MARK:- NIB register Name and Method
    static let identifier = "SearchCourseTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var courseThumbnail: UIImageView!
    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseInstructureName: UILabel!
    @IBOutlet var coursePrice: UILabel!
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
