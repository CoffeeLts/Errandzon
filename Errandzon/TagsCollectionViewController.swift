//
//  TagsCollectionViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 30/06/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit


class TagsCollectionViewController: UICollectionViewController {
    
    let cellScaling: CGFloat = 0.8
    var selectedTags = [String]()
    //let temp:SettingsViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.allowsMultipleSelection = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width * 0.8
        
        let insetX = (view.bounds.width - width ) / 3
        layout.sectionInset = UIEdgeInsets(top: 8, left: insetX, bottom: 8, right: insetX)
        layout.itemSize = CGSize(width: width / 2, height: width / 4.0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 6
        
        self.collectionView?.collectionViewLayout = layout
        
        let bgImage = UIImageView();
        bgImage.image = UIImage(named: "nightTheme")
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
    
        cell.tagsLabel.text = tags[indexPath.item]
        
        cell.backgroundColor = colors[indexPath.item % colors.count]
        //cell.frame.size = setsize(self.collectionView!, layout: self.collectionViewLayout, sizeForItemAt: indexPath)
        
        return cell
    }
    
    func animatedCollectionView(){
        collectionView?.reloadData()
        self.collectionView?.layoutIfNeeded()
        //let ary = collectionView?.visibleCells
        
        var cells = collectionView?.visibleCells
        let last_cell = cells?[(cells?.count)!-1]
        cells?.removeLast()
        cells?.insert(last_cell!, at: 0)
        
        for cell in cells! {
            let indexPath:IndexPath = (collectionView?.indexPath(for: cell))!
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let cell = collectionView.cellForItem(at: indexPath) as! TagsCollectionViewCell
        self.selectedTags.append(tags[indexPath.item])
        //
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       // let cell = collectionView.cellForItem(at: indexPath) as! TagsCollectionViewCell
        if let index = selectedTags.index(of: tags[indexPath.item]) {
           
            self.selectedTags.remove(at: index)
        }
        
       //
        
    }
    
    
    @IBAction func saveTags(_ sender: Any) {
        
        showAlertButton(sender)
       
    }
    func showAlertButton(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "New Tags", message: "Add new Tags?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: insertNewTags))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func insertNewTags(alert: UIAlertAction!) {
        user_tags.append(contentsOf: selectedTags)
        for items in user_tags{
            print(items)
        }
        
        self.performSegue(withIdentifier: "unwindToSettings", sender: self)
    }
    


}
