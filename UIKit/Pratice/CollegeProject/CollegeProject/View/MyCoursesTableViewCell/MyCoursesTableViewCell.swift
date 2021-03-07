//
//  MyCoursesTableViewCell.swift
//  CollegeProject
//
//  Created by Yash on 13/02/21.
//

import UIKit

class MyCoursesTableViewCell: UITableViewCell {

    //MARK:- NIB register Name and Method
    static let identifier = "MyCoursesTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    //MARK:- Outlets
    @IBOutlet var courseThumbnail: UIImageView!
    @IBOutlet var coureName: UILabel!
    @IBOutlet var courseInstructorName: UILabel!
    @IBOutlet var courseProgress: UIProgressView!
    @IBOutlet var courseStatus: UILabel!
    
    //MARK:- LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
