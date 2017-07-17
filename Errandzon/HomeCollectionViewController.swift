//
//  HomeCollectionViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController {
    
//    let menuBar: MenuBar = {
//        let mb  = MenuBar()
//        return mb
//    }()
    
    var Server:ServerManage!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var local_errands = [Errands]()

    
    var cellScaling:CGFloat = 0.9
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Errandzon"
        
        Server = appDelegate.Server
        local_errands = Server.matchedErrands
        
        setupCollectionView()
        

    }
    
    func setupCollectionView(){
        //collectionView?.backgroundColor = UIColor.black
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor((view.bounds.height - 50) * 0.8)
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = ((view.bounds.height - 50) - cellHeight) / 2.0
        
        let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsets(top: insetY + 50, left: insetX, bottom: insetY, right: insetX)
        
        //collectionView?.register(MatchedFeedCell.self, forCellWithReuseIdentifier: "MFCell")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
        // Dispose of any resources that can be recreated.
    }
   
//    private func setupMenuBar(){
//        navigationController?.hidesBarsOnSwipe = true
//        
//        view.addSubview(menuBar)
//        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
//        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
//          
//    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("local_errands : \(local_errands.count)")
        return local_errands.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MFCell", for: indexPath) as! MatchedFeedCell
        
        print(local_errands[indexPath.item].publisher)
        cell.publisherLabel.text = local_errands[indexPath.row].publisher
        cell.titleLabel.text = local_errands[indexPath.row].title
        cell.rewardsTextView.text = local_errands[indexPath.row].rewards
        cell.tagsLabel.text = ""
        let total_count = local_errands[indexPath.row].tags.count
        var count = 0
        for tags in local_errands[indexPath.row].tags{
            
            cell.tagsLabel.text?.append(tags)
            if(count + 1 != total_count){
                 cell.tagsLabel.text?.append(", ")
            }
            
            count = count + 1
           
        }
    
        // Configure the cell
     
        return cell
        
        
    }
   
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
            
        offset = CGPoint(x:roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    

// perform segue---------------------------------
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetails(indexPath: indexPath.row)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homePageDetailSeque" {
            let row = sender as! Int
            
      
            let errandDetails = segue.destination as! HomePageDetailViewController
            
            errandDetails.local_errands = self.local_errands[row]
        }
    }
    
    func showDetails(indexPath: Int){
         self.performSegue(withIdentifier: "homePageDetailSeque", sender: indexPath)
    }
    



}
