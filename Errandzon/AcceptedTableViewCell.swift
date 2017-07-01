//
//  AcceptedTableViewCell.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AcceptedTableViewCell: UITableViewCell {
    
    @IBOutlet var publisher: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var rewards: UILabel!
    @IBOutlet var details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
