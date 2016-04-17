//
//  TutorTableViewCell.swift
//  tutorFinder
//
//  Created by D.O. on 4/17/16.
//  Copyright © 2016 ZhangYipeng. All rights reserved.
//

import UIKit

class TutorTableViewCell: UITableViewCell {

   /* override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    */

    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var availability: UILabel!
    
    @IBOutlet weak var rating: UIImageView!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
