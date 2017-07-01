//
//  AnimationCollectionViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 30/06/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit
import AnimatedCollectionViewLayout
private let reuseIdentifier = "Cell"



class SimpleCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var aLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    func bind(color: String, imageName: String) {
        contentView.backgroundColor = color.hexColor
        //aLabel.text = "ssss"
    }
}

extension String {
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


class AnimationCollectionViewController: UICollectionViewController {
    
    
    var animator: (LayoutAttributesAnimator, Bool, Int, Int)?
    var direction: UICollectionViewScrollDirection = .horizontal
    
    let cellIdentifier = "SimpleCollectionViewCell"
    let vcs = [("f44336", "nature1"),
               ("9c27b0", "nature2"),
               ("3f51b5", "nature3"),
               ("03a9f4", "animal1"),
               ("009688", "animal2"),
               ("8bc34a", "animal3"),
               ("FFEB3B", "nature1"),
               ("FF9800", "nature2"),
               ("795548", "nature3"),
               ("607D8B", "animal1")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = AnimatedCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.animator = CubeAttributesAnimator()
        collectionView?.collectionViewLayout = layout
        
        collectionView?.isPagingEnabled = true
        
        self.collectionView!.register(SimpleCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
//        if let layout = collectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
//            layout.scrollDirection = .horizontal
//            layout.animator = animator?.0
//        }

        // Do any additional setup after loading the view.
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        // Turn on the paging mode for auto snaping support.
//        collectionView?.isPagingEnabled = true
//        
//        if let layout = collectionView?.collectionViewLayout as? AnimatedCollectionViewLayout {
//            layout.scrollDirection = direction
//            layout.animator = animator?.0
//        }
//        
//        dismissGesture.direction = direction == .horizontal ? .down : .left
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let c = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let cell = c as? SimpleCollectionViewCell {
            let i = indexPath.row % vcs.count
            let v = vcs[i]
            cell.bind(color: v.0, imageName: v.1)
          //  cell.aLabel.text = "shit"
            cell.clipsToBounds = animator?.1 ?? true
        }
    
        return c
    }
    
    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        if let layout = collectionView.collectionViewLayout as? AnimatedCollectionViewLayout {
                        layout.scrollDirection = .horizontal
                        layout.animator = animator?.0
            }
    }
}


extension AnimationCollectionViewController: UICollectionViewDelegateFlowLayout {
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Int(Int16.max)
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let c = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
//        
//        if let cell = c as? SimpleCollectionViewCell {
//            let i = indexPath.row % vcs.count
//            let v = vcs[i]
//            cell.bind(color: v.0, imageName: v.1)
//            cell.clipsToBounds = animator?.1 ?? true
//        }
//        
//        return c
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        view.bounds.size 
         var size = CGSize(width: 50, height: 50)
        guard let animator = animator else { return size}
//        return CGSize(width: (view.bounds.width/2) / CGFloat(animator.2), height: (view.bounds.height/2) / CGFloat(animator.3) )
        
        

      
        return CGSize(width: (50) / CGFloat(animator.2)-50, height: (50) / CGFloat(animator.3) )
        
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


