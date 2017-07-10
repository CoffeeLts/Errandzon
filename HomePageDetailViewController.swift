//
//  HomePageDetailViewController.swift
//  Errandzon
//
//  Created by RTC15 on 2017/6/27.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class HomePageDetailViewController: UITableViewController {
    var local_errands:Errands!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 120.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "HomePageCell",
                                                     for: indexPath) as! HomePageDetailTableViewCell
            // Configure the cell...
            
            
            
            switch indexPath.row {
            case 0:
                cell2.fieldLabel.text = "Title"
                cell2.valueLabel.text = local_errands.title
            case 1:
                cell2.fieldLabel.text = "Publisher"
                cell2.valueLabel.text = local_errands.publisher
            case 2:
                cell2.fieldLabel.text = "Rewards"
                cell2.valueLabel.text = local_errands.rewards
            case 3:
                cell2.fieldLabel.text = "Details"
                cell2.valueLabel.text = local_errands.details
            default:
                cell2.fieldLabel.text = ""
                cell2.valueLabel.text = ""
            }
            cell2.backgroundColor = UIColor.clear
            return cell2
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "You accept this job now.", message: "you can't regret", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        
    }



}
