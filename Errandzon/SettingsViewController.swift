//
//  SettingsViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout  {
    
    var local_tags = ["Delivery","Coding","Fishing","Repair","Others"]
    @IBOutlet var tagsBox: UICollectionView!
    let cellScaling: CGFloat = 0.6
    var editEnabled = false
    var selectedTags = [String]()
    var isDoneSelectingToRemove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupCollectionView(){
        //collectionView?.backgroundColor = UIColor.black
        //let screenSize = UIScreen.main.bounds.size
        tagsBox.register(TagBoxCell.self, forCellWithReuseIdentifier: "tagCell")
//        let cellWidth = floor(view.bounds.width * cellScaling)
//        let cellHeight = floor((view.bounds.height) * 0.8)
        
//        let insetX = (view.bounds.width - cellWidth) / 2.0
//        let insetY = ((view.bounds.height ) - cellHeight) / 2.0
        
     //   let layout = tagsBox!.collectionViewLayout as! UICollectionViewFlowLayout
        tagsBox.contentInset = UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
        tagsBox.dataSource = self
        tagsBox.delegate = self
        
        
        
        //collectionView?.register(MatchedFeedCell.self, forCellWithReuseIdentifier: "MFCell")
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return local_tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let size = CGSize(width: (tagsBox.frame.width-20)/3, height: (tagsBox.frame.height-20)/3)
        print (size.width)
        print (size.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagBoxCell

        cell.tagsLabel.text = local_tags[indexPath.row]
        cell.backgroundColor = UIColor(rgb: 0x358E7C)
        // Configure the cell
        
        return cell
        
        
    }
    
    @IBAction func EditButton(_ sender: Any) {
        let sender  = sender as! UIButton
        if(editEnabled == false){
            editEnabled = true
            sender.setTitle("DONE", for: .normal)
            
            tagsBox.allowsMultipleSelection = true
            
        }
        else{
            
            if(selectedTags.count != 0){
                doneSelectingToRemove(sender)
                if(isDoneSelectingToRemove == false){
                    return
                }
                else{
                    editEnabled = false
                    sender.setTitle("EDIT", for: .normal)
                    isDoneSelectingToRemove = false
                    tagsBox.allowsMultipleSelection = false
                }
            }
            editEnabled = false
            sender.setTitle("EDIT", for: .normal)
            isDoneSelectingToRemove = false
            tagsBox.allowsMultipleSelection = false
        }
    }
    
    func doneSelectingToRemove(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "\(selectedTags.count)(s) has been selected. Confirm remove?", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: removeTags))
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    func removeTags(alert: UIAlertAction!) {
        
    
//        let total = tagsBox.indexPathsForSelectedItems!.count
//        for indexPath in tagsBox.indexPathsForSelectedItems!(from: total, to: 1, by: -1) {
//            print(local_tags[indexPath.item])
//            let cell = tagsBox.cellForItem(at: indexPath) as! TagBoxCell
//            print(cell.tagsLabel.text!)
//            cell.deleteIcon.isHidden = true
//        }
        for item in selectedTags{
            if let index = local_tags.index(of: item) {
                //print("\(local_tags[index]) deleted!")
                self.local_tags.remove(at: index)
                
            }
        }
        isDoneSelectingToRemove = true
        selectedTags.removeAll()
        
        
        tagsBox.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            selectedTags.append(local_tags[indexPath.item])
            cell.deleteIcon.isHidden = false
        }
        
        //
    }
    
    // Deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            cell.deleteIcon.isHidden = true
            if let index = selectedTags.index(of: local_tags[indexPath.item]) {
                self.selectedTags.remove(at: index)
            }
        }
    }
    
 
    
    
}
