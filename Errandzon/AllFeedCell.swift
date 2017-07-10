//
//  AllFeedCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 09/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit


class AllFeedCell: UITableViewCell{
    
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
