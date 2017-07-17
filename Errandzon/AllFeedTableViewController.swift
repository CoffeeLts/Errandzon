//
//  AllFeedTableViewController.swift
//  Errandzon
//
//  Created by LimTzeSuen on 10/07/2017.
//  Copyright © 2017 Revolutionaries. All rights reserved.
//

import UIKit

class AllFeedTableViewController: UITableViewController {
    
    
    var Server:ServerManage!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var local_errands = [Errands]()
    override func viewDidLoad() {
        super.viewDidLoad()

        Server = appDelegate.Server
        local_errands = Server.allErrands
        tableView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return local_errands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //    let myAcceptErrands = appDelegate.myAcceptErrands
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AllFeedCell

        
        cell.publisher.text = local_errands[indexPath.row].publisher
        cell.title.text = local_errands[indexPath.row].title
        cell.details.text = local_errands[indexPath.row].details
        cell.rewards.text = local_errands[indexPath.row].rewards
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        let myAcceptErrands = appDelegate.myAcceptErrands
        if segue.identifier == "homePageDetailSeque" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! HomePageDetailViewController
                destinationController.local_errands = local_errands[indexPath.row]
            } }
    }
    
    
}
