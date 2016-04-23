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

    @IBOutlet weak var rating1: UIImageView!
    @IBOutlet weak var rating2: UIImageView!
    @IBOutlet weak var rating3: UIImageView!
    @IBOutlet weak var rating4: UIImageView!
    @IBOutlet weak var rating5: UIImageView!
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
