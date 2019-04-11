//
//  GoalCell.swift
//  GoalPost
//
//  Created by Ravi Inder Manshahia on 05/04/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalDayCounter: UILabel!
    
    @IBOutlet weak var goalDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confirgureCell(description: String, type: String, duration: Int)
    {
        goalDescription.text = description
        goalType.text = type
        goalDayCounter.text = String(duration)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
