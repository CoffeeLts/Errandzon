//
//  MenuBar.swift
//  Errandzon
//
//  Created by RTC14 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    
    
    let menuItems = ["Your Matches","All"]
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    var homeController: HomePageViewController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(rgb: 0x358E7C)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "menuCell"
   // var homeController = HomePageViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "menuCell")
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        //collectionView.cellForItem(at: selectedIndexPath)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        setupHorizontalBar()
        
       // backgroundColor = UIColor(rgb: 0x358E7C)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for:  indexPath) as! MenuCollectionViewCell
        
        cell.menuBarLabel.text = menuItems[indexPath.item]
       
        cell.tintColor = UIColor(rgb: 0x286C5F)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
     
        let size = CGSize(width: frame.width/2, height: frame.height)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 2
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        
        homeController?.switchPage(menuIndex: indexPath.item)
    }
    
    func setupHorizontalBar(){
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint =  horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
       
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        //addConstraintsWithFormat(<#T##format: String##String#>, views: <#T##UIView...##UIView#>)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}
