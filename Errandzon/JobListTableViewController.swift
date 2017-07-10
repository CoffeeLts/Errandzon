//
//  JobListTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class JobListTableViewController: UITableViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBAction func unwindToHomeScreen3(segue:UIStoryboardSegue) {
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
      //  let myPostList = appDelegate.myPostList
        return myPostList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
      //  let myPostList = appDelegate.myPostList
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! JobListTableViewCell
        // Configure the cell...
        
        cell.publisher.text = myPostList[indexPath.row].publisher
        cell.title.text = myPostList[indexPath.row].title
        cell.details.text = myPostList[indexPath.row].details
        cell.rewards.text = myPostList[indexPath.row].rewards
        return cell
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   let myPostErrands = appDelegate.myPostList
        if segue.identifier == "showJoblistDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! JobListDetailTableViewController
                destinationController.errands = myPostList[indexPath.row]
            }
        }
    }
    

    
    
    

    

    
}
