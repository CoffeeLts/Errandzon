//
//  AcceptedDetailTableViewController.swift
//  Errandzon
//
//  Created by RTC30 on 2017/6/30.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class AcceptedDetailTableViewController: UITableViewController {
    var errands:Errands!
    
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
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AcceptDetailCell",
                                                  for: indexPath) as! AcceptedDetailTableViewCell
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell3.fieldLabel.text = "Title"
            cell3.valueLabel.text = errands.title
        case 1:
            cell3.fieldLabel.text = "Publisher"
            cell3.valueLabel.text = errands.publisher
        case 2:
            cell3.fieldLabel.text = "Rewards"
            cell3.valueLabel.text = errands.rewards
        case 3:
            cell3.fieldLabel.text = "Details"
            cell3.valueLabel.text = errands.details
        case 4:
            cell3.fieldLabel.text = "Tags"
            let total_count = errands.tags.count
            var count = 0
            cell3.valueLabel.text = ""
            for tags in errands.tags{
                cell3.valueLabel.text?.append(tags)
                if(count + 1 != total_count){
                    cell3.valueLabel.text?.append(", ")
                }
                count = count + 1
            }
        default:
            cell3.fieldLabel.text = ""
            cell3.valueLabel.text = ""
        }
        cell3.backgroundColor = UIColor.clear
        return cell3
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
