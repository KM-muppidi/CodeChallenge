//
//  TimeStampCell.swift
//  CodeChallenge
//
//  Created by Kavya Muppidi on 18/10/19.
//  Copyright © 2019 Kavya Muppidi. All rights reserved.
//

import UIKit

class TimeStampCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var entryTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    func configureCell(with timeStamp: TimeStamp) {
        name.text = timeStamp.name
        entryTime.text = timeStamp.entryTime
    }
}
