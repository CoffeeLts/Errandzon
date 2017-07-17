//
//  SettingsViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class SettingsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout  {
    
    var Server:ServerManage!
    

    
    @IBAction func facebookLogOut(_ sender: UIButton) {
        let confirmationButton = (Any).self
        FBSDKLoginManager().logOut()
        print("you are loggin out")
        print(FBSDKAccessToken.current())
        showAlertButton(confirmationButton)
        
    }
    
    
    @IBAction func unwindToSettings(segue:UIStoryboardSegue) {
        DispatchQueue.main.async {
            self.Server.getSubscribedTags(callback: self.asdasd)
        }
        
        
    }
    
    func asdasd(_ a:ServerState){
        self.tagsBox.reloadData()
    }
    
    @IBOutlet var tagsBox: UICollectionView!
    let cellScaling: CGFloat = 0.6
    var editEnabled = false
    var selectedTags = [String]()
    var isDoneSelectingToRemove = false
    var localSubscribedTags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        Server = appDelegate.Server
        
        self.localSubscribedTags = Server.subscribedTags
        
        setupCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    
    func setupCollectionView(){
        //collectionView?.backgroundColor = UIColor.black
        //let screenSize = UIScreen.main.bounds.size
        tagsBox.register(TagBoxCell.self, forCellWithReuseIdentifier: "tagCell")
        
        tagsBox.layer.borderWidth = 1
        tagsBox.layer.borderColor = UIColor.white.cgColor
        
//        let cellWidth = floor(view.bounds.width * cellScaling)
//        let cellHeight = floor((view.bounds.height) * 0.8)
        
//        let insetX = (view.bounds.width - cellWidth) / 2.0
//        let insetY = ((view.bounds.height ) - cellHeight) / 2.0
        
     //   let layout = tagsBox!.collectionViewLayout as! UICollectionViewFlowLayout
        tagsBox.contentInset = UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
        tagsBox.dataSource = self
        tagsBox.delegate = self
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("Total subscribed tags = \(Server.subscribedTags.count)")
        return Server.subscribedTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: (tagsBox.frame.width-20)/3, height: (tagsBox.frame.height-20)/3)

        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagBoxCell

        cell.tagsLabel.text = Server.subscribedTags[indexPath.row]
        cell.backgroundColor = UIColor(rgb: 0x358E7C)
        cell.deleteIcon.isHidden = true
        // Configure the cell
        
        return cell
        
        
    }
    
    @IBAction func EditButton(_ sender: Any) {
        let sender  = sender as! UIButton
        if(editEnabled == false){
            editEnabled = true
            sender.setTitle("DONE", for: .normal)
            
            tagsBox.allowsMultipleSelection = true
            print("Edit Mode\n")
            
        }
        else{
            print("Total Selected Tags = \(selectedTags.count)")
            if(selectedTags.count != 0){
                doneSelectingToRemove(sender)
                // MARKKK
                if(isDoneSelectingToRemove == false){
                    
                   
                    return
                }
//                else{
//                    editEnabled = false
//                    sender.setTitle("EDIT", for: .normal)
//                    isDoneSelectingToRemove = false
//                    tagsBox.allowsMultipleSelection = false
//                }
            }
            print("Done Editing")
            editEnabled = false
            sender.setTitle("EDIT", for: .normal)
            isDoneSelectingToRemove = false
            tagsBox.allowsMultipleSelection = false
        }
    }
    
    func doneSelectingToRemove(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "\(selectedTags.count)(s) has been selected. Confirm remove?", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in self.removeTags(sender: sender)}))
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    func removeTags(sender: Any) {
        
        let button = sender as! UIButton
 
        for item in selectedTags{
            if let index = Server.subscribedTags.index(of: item) {
                print("\(Server.subscribedTags[index]) deleted!")
             //   localSubscribedTags.remove(at: index)
                
            }
        }
        isDoneSelectingToRemove = true
        print("Done Editing")
        editEnabled = false
        button.setTitle("EDIT", for: .normal)
        tagsBox.allowsMultipleSelection = false
        Server.removeTags(selectedTags, callback: removeFromView)
        selectedTags.removeAll()
        
        
    }
    
    func showAlertButton(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "Log out", message: "If you want to change the other \n USER ACCOUNT \n You can enter the new facebook account later \n OR ... If you want to log out \n then BYE BYE ", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "LOG OUT", style: UIAlertActionStyle.destructive, handler: relogin))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func relogin(alert: UIAlertAction!) {
        self.performSegue(withIdentifier: "relogin", sender: self)
    }
    
    func removeFromView(_a:ServerState) {
        
        
        self.Server.getSubscribedTags(callback: reload)
        
        
    }
    
    func reload(_a:ServerState){
        DispatchQueue.main.async {
            
            self.tagsBox.reloadData()
        }
    }
    
    // Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            selectedTags.append(Server.subscribedTags[indexPath.item])
            cell.deleteIcon.isHidden = false
        }

    }
    
    // Deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            cell.deleteIcon.isHidden = true
            if let index = selectedTags.index(of: Server.subscribedTags[indexPath.item]) {
                self.selectedTags.remove(at: index)
            }
        }
    }
    
 
    
    
}
