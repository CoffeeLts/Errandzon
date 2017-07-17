//
//  AddPostTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/25.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {
    
    
   
    
    var Server:ServerManage!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var postTitleTextField: UITextField!
    @IBOutlet var postRewardTextField: UITextField!
    @IBOutlet var postDetailsTextField: UITextField!
    
    @IBOutlet var tagsBox: UICollectionView!
    let cellScaling: CGFloat = 0.6
    var errands:Errands?
    var editEnabled = false
    var selectedTags = [String]()
    var isDoneSelectingToRemove = false
    var localSubscribedTags = [String]()
    var errandTags = [String]()
    
    @IBAction func unwindFromTagView(segue:UIStoryboardSegue) {
        DispatchQueue.main.async {
            for item in self.errandTags {
                print(item)
            }
            self.tagsBox.reloadData()
            
        }
    }
    
    @IBAction func unwindToPublishing(segue:UIStoryboardSegue) {
        DispatchQueue.main.async {
            print("asdasda")
            for item in self.errandTags {
                print(item)
            }
            self.tagsBox.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Server = appDelegate.Server
        self.textViewSetting(textField: postTitleTextField)
        self.textViewSetting(textField: postRewardTextField)
        self.textViewSetting(textField: postDetailsTextField)
        
        setupCollectionView()
        
        
        
    }
    func textViewSetting(textField:UITextField){
        let myColor : UIColor = UIColor.white
        textField.layer.cornerRadius = 8.0
        textField.layer.masksToBounds = true
        textField.layer.borderColor = myColor.cgColor
        textField.layer.borderWidth = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    
    
    @IBAction func addNewPost(_ sender: Any) {
        let confirmationButton = (Any).self
        
        let postTitle = postTitleTextField.text

        var rewards = postRewardTextField.text
        let details = postDetailsTextField.text
        
        
        if postTitle == "" || details == ""{
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that fields with '*' are required.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        if self.errandTags.count == 0 {
            let alertController = UIAlertController(title: "Oops", message: "Please at least choose one tag.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        
        if rewards == "" {
            rewards = "Yet to be told"
        }
        
//        errands = Errands(publisher: "Me", title: postTitle!, details: details!, rewards: rewards!, publishTime: getCurrentTime(), tags: ["None"])
        
        self.errands = Errands(publisher: "Me", title: postTitle!, details: details!, rewards: rewards!, publishTime: getCurrentTime(), tags: errandTags)
        
        showAlertButton(confirmationButton)
        
    }
    
    func showAlertButton(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "New Post", message: "Add new Post?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: insertNewPost))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func insertNewPost(alert: UIAlertAction!) {
        LoadingOverlay.shared.showOverlay(view: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
           self.Server.postErrandsByMe(errand: self.errands!, callback: self.backToPostList)
        })
        
        
    }

    func backToPostList(_a: ServerState){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            LoadingOverlay.shared.hideOverlayView()
            self.performSegue(withIdentifier: "unwindToMyPostList", sender: self)
        })
    }
    
    func getCurrentTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return "hours = \(hour):\(minutes):\(seconds)"
    }
    
    // ---------------------------------------------Tag BOX------------------------------------------
    
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
        
        print("Total subscribed tags = \(errandTags.count)")
        return errandTags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: (tagsBox.frame.width-20)/3, height: (tagsBox.frame.height-20)/3)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCell", for: indexPath) as! TagBoxCell
        
        cell.tagsLabel.text = errandTags[indexPath.row]
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
            if let index = errandTags.index(of: item) {
                print("\(errandTags[index]) deleted!")
                   errandTags.remove(at: index)
                
            }
        }
        isDoneSelectingToRemove = true
        print("Done Editing")
        editEnabled = false
        button.setTitle("EDIT", for: .normal)
        tagsBox.allowsMultipleSelection = false
        //Server.removeTags(selectedTags, callback: removeFromView)
        selectedTags.removeAll()
        self.tagsBox.reloadData()
        
    }
    
    
    // Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            selectedTags.append(errandTags  [indexPath.item])
            cell.deleteIcon.isHidden = false
        }
        
    }
    
    // Deselect
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TagBoxCell
        if(editEnabled == true){
            cell.deleteIcon.isHidden = true
            if let index = selectedTags.index(of: errandTags[indexPath.item]) {
                self.selectedTags.remove(at: index)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "addTagsFromNewPost"){
            let tagController : TagsCollectionViewController = segue.destination as! TagsCollectionViewController
            tagController.fromNewPost = true
        }
    }

}
