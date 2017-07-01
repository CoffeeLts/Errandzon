//
//  Errands.swift
//  Errandzon
//
//  Created by RTC14 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import Foundation

class Errands {
    
    var publisher = ""
    var title = ""
    var details = ""
    var rewards = ""
    var publishTime = ""
    var tags = [String]()
   
    
    init(publisher:String, title:String, details: String, rewards:String, publishTime:String){
        self.publisher = publisher
        self.title = title
        self.details = details
        self.rewards = rewards
        self.publishTime = publishTime
        
    }
    
    
}
