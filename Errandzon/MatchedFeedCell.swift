//
//  CollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class MatchedFeedCell: UICollectionViewCell {
    
    @IBOutlet var publisherLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rewardsTextView: UITextView!
    @IBOutlet var tagsLabel: UILabel!
    
//    lazy var publisherLabel: UILabel = {
//        let publisher = UILabel()
//        return UILabel()
//    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        
      
      //  clipsToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor =  UIColor.white.cgColor
        
        
    }

    

    
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
    }
   
    
}
