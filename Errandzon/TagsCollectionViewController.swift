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
    var local_tags = [String]()
    
    //let temp:SettingsViewController?
    var Server:ServerManage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        Server = appDelegate.Server
        
        for item in Server.notSubscribedTags{
            print(item)
        }
            
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
        if(Server.is_new == true){
           // Server.getAllTags(callback: {_ in })
            local_tags = Server.alltags
        }
        else{
           // Server.getNotSubscribedTags(callback: {_ in })
            local_tags = Server.notSubscribedTags
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        animatedCollectionView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return local_tags.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagsCollectionViewCell
        
        cell.tagsLabel.text = local_tags[indexPath.item]
        
        cell.backgroundColor = colors[indexPath.item % colors.count]
        
        return cell
    }
    
    func animatedCollectionView(){
        collectionView?.reloadData()
        self.collectionView?.layoutIfNeeded()
        //let ary = collectionView?.visibleCells
        
        var cells = collectionView?.visibleCells
        if (cells?.count != 0 ){
            let last_cell = cells?[(cells?.count)!-1]
            
            cells?.removeLast()
            cells?.insert(last_cell!, at: 0)
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
        self.selectedTags.append(local_tags[indexPath.item])
        //
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        // let cell = collectionView.cellForItem(at: indexPath) as! TagsCollectionViewCell
        if let index = selectedTags.index(of: local_tags[indexPath.item]) {
            
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
        print("clicked save")
        print("Adding the following tags..")
        for tags in selectedTags {
           
            print(tags)
        }
        print("\n")
        Server.addTag(selectedTags, callback: saveTags)
   
    }
    
    
    func saveTags(_ state:ServerState){
        print("callback now-> \(state.rawValue)")
        print(Server.is_new)
        if state == ServerState.Pass {
            // adding to local user_tags
            
            //user_tags.append(contentsOf: selectedTags)
            self.Server.getNotSubscribedTags(callback: {_ in})
            //collectionView?.reloadData()
            //self.collectionView?.layoutIfNeeded()
            
            if Server.is_new == true {
                
                
                Server.is_new = false
                
                self.performSegue(withIdentifier: "init", sender: nil)
                return
            }
            print("Unwinding to settings...")
           
            self.performSegue(withIdentifier: "unwindToSettings", sender: self)
        }
    }
    
    
}
