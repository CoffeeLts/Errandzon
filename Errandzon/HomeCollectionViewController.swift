//
//  HomeCollectionViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {
    
    @IBOutlet var blackMaskingvView: UIView!
    
    
    var cellScaling:CGFloat = 0.9
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "Home"
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(screenSize.width * cellScaling)
       
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        collectionView?.contentInset = UIEdgeInsets(top: insetX, left: insetX, bottom: insetY, right: insetX)
//        blackMaskingvView.layer.borderColor = UIColor.white as! CGColor
//        blackMaskingvView.layer.borderWidth = 2.0
//        collectionView?.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "homePageCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return errands.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homePageCell", for: indexPath) as! HomeCollectionViewCell
        
        print(errands[indexPath.row].publisher)
        if((cell==nil) == true){
            print("cell is null")
        }
        
 //       cell.publisherLabel.text = errands[indexPath.row].publisher
 //       cell.titleLabel.text = errands[indexPath.row].title
//        cell.details.text = errands[indexPath.row].details
//        cell.rewards.text = errands[indexPath.row].rewards
//    
        // Configure the cell
     
        return cell
        
        
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        showDetails(indexPath: indexPath)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homePageDetailSeque" {
            let sender = sender as! IndexPath
            let errandDetails = segue.destination as! HomePageDetailViewController
            errandDetails.local_errands = errands[sender.item]
        }
    }
    
    func showDetails(indexPath: IndexPath){
         self.performSegue(withIdentifier: "homePageDetailSeque", sender: indexPath)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width:view.frame.width,height: 200)
        
    }



}
