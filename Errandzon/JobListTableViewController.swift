//
//  JobListTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class JobListTableViewController: UITableViewController {
    var Server:ServerManage!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var local_errands = [Errands]()
    var refresher: UIRefreshControl!
    
    @IBAction func unwindToHomeScreen3(segue:UIStoryboardSegue) {
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
      //  let myPostList = appDelegate.myPostList
        return local_errands.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
      //  let myPostList = appDelegate.myPostList
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! JobListTableViewCell
        // Configure the cell...
        
        cell.publisher.text = local_errands[indexPath.row].publisher
        cell.title.text = local_errands[indexPath.row].title
        cell.details.text = local_errands[indexPath.row].details
        cell.rewards.text = local_errands[indexPath.row].rewards
        return cell
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Server = appDelegate.Server
        local_errands = Server.errandsByMe
        
        refresher = UIRefreshControl()
        tableView.addSubview(refresher)
        
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        
        
    }
    func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: ({
            self.Server.getErrandsByMe(callback: self.reload)

        }))
    }
    func reload(_ a:ServerState){
        DispatchQueue.main.async{
            self.tableView.reloadData()
            self.refresher.endRefreshing()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   let myPostErrands = appDelegate.myPostList
        if segue.identifier == "showJoblistDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! JobListDetailTableViewController
                destinationController.errands = local_errands[indexPath.row]
            }
        }
    }
    

    
    
    

    

    
}
