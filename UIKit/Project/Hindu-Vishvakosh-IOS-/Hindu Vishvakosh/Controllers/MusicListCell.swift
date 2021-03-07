//
//  MusicListCell.swift
//  Hindu Vishvakosh
//
//  Created by haco on 12/07/20.
//  Copyright © 2020 haco. All rights reserved.
//

import UIKit

class MusicListCell: UITableViewCell {

    @IBOutlet weak var trackImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
