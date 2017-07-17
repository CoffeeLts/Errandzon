//
//  AddCell.swift
//  Errandzon
//
//  Created by lily on 2017/7/17.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AddCell: UICollectionViewCell {
    
    
    let image: UIImageView = {
        let image = UIImage(named: "add")
       
        var bgImage = UIImageView(image: image)
        bgImage.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return bgImage
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        
    }
    
    func setupViews(){

        
        self.layer.cornerRadius = 8
        
        addSubview(image)

        
        
        addConstraintsWithFormat("H:[v0(60)]", views: image)
        addConstraintsWithFormat("V:[v0(60)]", views: image)
        addConstraint(NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: image, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }

    
}
