//
//  AddPostTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/25.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var postTitleTextField: UITextField!
    @IBOutlet var postRewardTextField: UITextField!
    @IBOutlet var postDetailsTextField: UITextField!
    
    var errands:Errands?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textViewSetting(textField: postTitleTextField)
        self.textViewSetting(textField: postRewardTextField)
        self.textViewSetting(textField: postDetailsTextField)
        
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
      //  let validTime = validTimeTextField.text
        var rewards = postRewardTextField.text
        let details = postDetailsTextField.text
        
        
        if postTitle == "" || details == ""{
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that fields with '*' are required.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        if rewards == "" {
            rewards = "Undefined"
        }
        
        errands = Errands(publisher: "Me", title: postTitle!, details: details!, rewards: rewards!, publishTime: getCurrentTime(), tags: ["None"])
        
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
        myPostList.append(errands!)
//        appDelegate.myPostList.append(errands!)
        self.performSegue(withIdentifier: "unwindToMyPostList", sender: self)
    }

    
    
    func getCurrentTime() -> String{
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        return "hours = \(hour):\(minutes):\(seconds)"
    }
    
    


}
