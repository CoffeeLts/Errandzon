//
//  TagsCollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 30/06/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class TagsCollectionViewCell: BaseCollectionViewCell {
    

    var tagsLabel:UILabel = {
        let tags = UILabel()
        tags.font = UIFont(name:"MarkerFelt-Wide" , size: 24)
        tags.textAlignment = .center
        return tags
    }()
    
    var tickIcon:UIImageView = {
        
        let image: UIImage = UIImage(named: "tick1")!
        let tick = UIImageView(image: image)
        
        
//        let size = CGRect(x: 0, y: 0, width: 5, height: 5)
//        //tick.sizeThatFits(size)
//        tick.frame = CGRect(x: , y: 0, width: 20  , height: 20)
// 
        tick.alpha = 0.0
        tick.contentMode = .scaleAspectFill
        
        return tick
    }()
    
    override var isSelected: Bool  {
        didSet {
            tickIcon.alpha  = isSelected ?  1 : 0
            
        }
    }
    
//    func tick(){
//        tickIcon.alpha = 1
//    }
//    
//    func untick(){
//        tickIcon.alpha = 0
//    }
    
    override func setupViews(){
        
        self.layer.cornerRadius = 8
        
        addSubview(tagsLabel)
        addSubview(tickIcon)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: tagsLabel)
        addConstraintsWithFormat("V:|-8-[v0]|", views: tagsLabel)
        
        addConstraintsWithFormat("H:[v0(30)]-0-|", views: tickIcon)
        addConstraintsWithFormat("V:|-2-[v0(30)]", views: tickIcon)
     
        
    }
}
