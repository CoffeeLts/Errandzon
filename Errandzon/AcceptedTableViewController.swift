//
//  AcceptedTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AcceptedTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return myAcceptErrands.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let myAcceptErrands = appDelegate.myAcceptErrands
        let cellIdentifier = "Cell"
      
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AcceptedTableViewCell
        // Configure the cell...
        //cell.AcceptedtitleLabel.text = AcceptedJobTitles[indexPath.row]
        
        cell.publisher.text = myAcceptErrands[indexPath.row].publisher
        cell.title.text = myAcceptErrands[indexPath.row].title
        cell.details.text = myAcceptErrands[indexPath.row].details
        cell.rewards.text = myAcceptErrands[indexPath.row].rewards
        
        return cell
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let myAcceptErrands = appDelegate.myAcceptErrands
        if segue.identifier == "showAcceptedPostDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! AcceptedDetailTableViewController
                destinationController.errands = myAcceptErrands[indexPath.row]
            } }
    }
  
    
}
