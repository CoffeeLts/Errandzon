//
//  JobList.swift
//  Errandzon
//
//  Created by RTC10 on 2017/7/4.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import Foundation
class JobList {
    
    var publisher = ""
    var title = ""
    var details = ""
    var rewards = ""

    init(title:String, publisher:String, details:String, rewards:String) {
        self.title = title
        self.publisher = publisher
        self.details = details
        self.rewards = rewards
    }
}
