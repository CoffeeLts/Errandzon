//
//  BaseCollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 09/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init(coder eDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
