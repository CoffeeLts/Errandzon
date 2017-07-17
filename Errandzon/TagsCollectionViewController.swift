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
    let group = DispatchGroup()
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.Server.getNotSubscribedTags(callback: self.getTagsFromServer)
            })
            
            
           // group.enter()
//            DispatchQueue.main.async {
//                self.Server.getNotSubscribedTags(callback: self.getTagsFromServer)
//            }
           
            
        }
//        group.notify(queue: .main) {
            print("Local tag A = \(self.local_tags.count)")
//
//        }
        print("Local tag = \(local_tags.count)")
        
    }
    
    func getTagsFromServer(_ a:ServerState){
        //DispatchQueue.main.async(execute: {
            self.local_tags = self.Server.notSubscribedTags
       // })
        
        
        print("Server tag = \(Server.notSubscribedTags.count)")
        print("Local tag = \(local_tags.count)")
//        group.leave()

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
        print("count")
        print(Server.notSubscribedTags.count)
        if(Server.is_new == true){
            // Server.getAllTags(callback: {_ in })
            
            print(Server.alltags.count)
        
            return Server.alltags.count
        }
        else{
            print(Server.notSubscribedTags.count)
            return Server.notSubscribedTags.count
            
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagsCollectionViewCell
        
        
        if(Server.is_new == true){
            cell.tagsLabel.text = Server.alltags[indexPath.item]
        }
        else{
            cell.tagsLabel.text = Server.notSubscribedTags[indexPath.item]
        }
        
        
        
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
        
        if(Server.is_new == true){
            self.selectedTags.append(Server.alltags[indexPath.item])
        }
        else{
          
            self.selectedTags.append(Server.notSubscribedTags[indexPath.item])
        }
        
       // self.selectedTags.append(local_tags[indexPath.item])
        //
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        // let cell = collectionView.cellForItem(at: indexPath) as! TagsCollectionViewCell
        
        if(Server.is_new == true){
            if let index = selectedTags.index(of: Server.alltags[indexPath.item]) {
                
                self.selectedTags.remove(at: index)
            }
        }
        else{

            if let index = selectedTags.index(of: Server.notSubscribedTags[indexPath.item]) {
                
                self.selectedTags.remove(at: index)
            }
        }
        
        
        
        //
        
    }
    
    
    @IBAction func saveTags(_ sender: Any) {
        if(self.selectedTags.isEmpty == true){
            
            showSaveTagIfEmptyAlertButton(sender)
        }
        else{
            showSaveTagAlertButton(sender)
 
        }
       
    }
    func showSaveTagIfEmptyAlertButton(_ sender: Any) {
        
        // create the alert
        
        let alert = UIAlertController(title: "Opps", message: "No tags Selected!", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
       
        self.present(alert, animated: true, completion: nil)
    }
    
    func showSaveTagAlertButton(_ sender: Any) {
        
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
