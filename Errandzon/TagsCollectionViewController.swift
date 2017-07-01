//
//  TagsCollectionViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 30/06/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit


class TagsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / 2, height: width / 4.0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        self.collectionView?.collectionViewLayout = layout
        
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "tagTheme")
        bgImage.contentMode = .scaleToFill
        self.collectionView?.backgroundView = bgImage
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: "tagCell")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        animatedCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagsCollectionViewCell
    
        // Configure the cell
        
        cell.tagsLabel.text = tags[indexPath.item]
        
        cell.backgroundColor = colors[indexPath.item % colors.count]
        //cell.frame.size = setsize(self.collectionView!, layout: self.collectionViewLayout, sizeForItemAt: indexPath)
        
        return cell
    }
    
    func animatedCollectionView(){
        collectionView?.reloadData()
        self.collectionView?.layoutIfNeeded()
        let ary = collectionView?.visibleCells
        
        var cells = collectionView?.visibleCells
        let last_cell = cells?[(cells?.count)!-1]
        cells?.removeLast()
        cells?.insert(last_cell!, at: 0)
        
        for cell in cells! {
            var indexPath:IndexPath = (collectionView?.indexPath(for: cell))!
            print(indexPath)
        }
        
        let collectionViewHeight = collectionView?.bounds.size.height
        
        for cell in cells!{
            cell.transform = CGAffineTransform(translationX: 0, y: collectionViewHeight!)
        }
        var delayCounter = 0.0
        for cell in cells! {
            UIView.animate(withDuration: 0.5, delay: Double(delayCounter) * 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
              //  self.collectionView?.performBatchUpdates({ () -> Void in
                    cell.transform = CGAffineTransform.identity
              //  }, completion:nil)
            }, completion: nil)
            delayCounter += 0.5
        
        }
    }
    
    
    
    
    
    
    
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSize(width:view.frame.width,height: 200)
//        
//    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
