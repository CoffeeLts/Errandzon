//
//  CollectionViewCell.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var publisherLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rewardsLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    
    let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 24.0/255.0, green: 237.0/255.0, blue: 234.0/255.0, alpha: 0.5)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 245.0/255.0, alpha: 1.0).cgColor
        view.layer.cornerRadius = 25
        
        
//        var titleLabel:UILabel!
//        view.addSubview(titleLabel)
        return view
    }()
    

    
    
//    var titleLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = NSTextAlignment.center
//       //
//        label.font = UIFont(name:"MarkerFelt-Wide" , size: 20)
//        return label
//    }()
//    
//    var publisherLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = NSTextAlignment.center
//        label.textColor = UIColor.gray
//        //label.backgroundColor = UIColor(cgColor: REG_DUMP)
//        return label
//    }()
    
    func repositionLabel(label:UILabel, view:UIView){
        label.frame.origin.x = view.frame.origin.x
        label.frame.origin.y = view.frame.origin.y
        label.frame.size.width = view.frame.width - 16
        
    }
    
    func setupView(){
        addSubview(detailView)
        addSubview(titleLabel)
        addSubview(publisherLabel)
   
////        repositionLabel(label: titleLabel, view: detailView)
////        repositionLabel(label: publisherLabel, view: detailView)
//        
//        
//        //addSubview(titleLabel)
//        
//        
//        addContraintsWithFormat("H:|-16-[v0]-16-|", views: detailView)
//        addContraintsWithFormat("V:|-8-[v0]|", views: detailView)
//
//        addContraintsWithFormat("H:|-32-[v0]-32-|", views: titleLabel)
//        addContraintsWithFormat("V:|-16-[v0]", views: titleLabel)
        
       // addConstraint(<#T##constraint: NSLayoutConstraint##NSLayoutConstraint#>)
        
        
//
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
