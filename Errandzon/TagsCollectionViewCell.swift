//
//  TagsCollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 30/06/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout

class TagsCollectionViewCell: UICollectionViewCell {
    
    
    var tagsLabel:UILabel = {
        let tags = UILabel()
        tags.font = UIFont(name:"MarkerFelt-Wide" , size: 24)
        tags.textAlignment = .center
        return tags
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //addSubview(detailView)
        setupView()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupView(){
        addSubview(tagsLabel)
        
        addContraintsWithFormat("H:|-16-[v0]-16-|", views: tagsLabel)
        addContraintsWithFormat("V:|-8-[v0]|", views: tagsLabel)
    }
}
