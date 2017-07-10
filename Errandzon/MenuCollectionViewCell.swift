//
//  MenuCollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 09/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: BaseCollectionViewCell {
    
    let menuBarLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name:"MarkerFelt-Wide" , size: 20)
        
       // label.textColor = UIColor.white
        label.textColor = UIColor(rgb: 0x286C5F)
        return label
    }()
    
    override var isHighlighted: Bool  {
        didSet {
            menuBarLabel.textColor = isHighlighted ?  UIColor.white : UIColor(rgb: 0x286C5F)

        }
    }
    
    override var isSelected: Bool  {
        didSet {
            menuBarLabel.textColor = isSelected ?  UIColor.white : UIColor(rgb: 0x286C5F)
            
        }
    }
    
    override func setupViews(){
        super.setupViews()
     
        addSubview(menuBarLabel)
        addConstraintsWithFormat("H:[v0]", views: menuBarLabel)
        addConstraintsWithFormat("V:[v0]", views: menuBarLabel)
        addConstraint(NSLayoutConstraint(item: menuBarLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: menuBarLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
   
    }
    
    
}
