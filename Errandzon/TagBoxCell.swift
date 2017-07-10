//
//  TagBoxCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class TagBoxCell: BaseCollectionViewCell {
    
    let tagsLabel: UILabel = {
        let tag = UILabel()
        tag.textAlignment = .center
        tag.textColor = UIColor.white
        tag.font = UIFont(name:"MarkerFelt-Thin" , size: 12)
        
        return tag
    }()
    
    let deleteIcon:UIImageView = {
        
        let image: UIImage = UIImage(named: "cancel")!
        let deleteIcon = UIImageView(image: image)
        
        
        deleteIcon.isHidden = true
        deleteIcon.contentMode = .scaleAspectFill
        
        return deleteIcon
    }()
    
    override func setupViews(){
        super.setupViews()
        
        self.layer.cornerRadius = 8
        
        addSubview(tagsLabel)
        addSubview(deleteIcon)
        
        
        addConstraintsWithFormat("H:[v0]", views: tagsLabel)
        addConstraintsWithFormat("V:[v0]", views: tagsLabel)
        addConstraint(NSLayoutConstraint(item: tagsLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tagsLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
        addConstraintsWithFormat("H:[v0(30)]|", views: deleteIcon)
        addConstraintsWithFormat("V:|[v0(30)]", views: deleteIcon)
        
    }
    
}
