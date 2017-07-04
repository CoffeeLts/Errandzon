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
    
    
    
    //var JobTitles = ["buy breakfast", "buy lunch", "buy dinner", "buy apple", "buy bunana", "debug", "你好", "チケットを買います", "kaupa miða", "купити улазнице", "Köp biljetter"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of rows in the section.
            let myPostList = appDelegate.myPostList
            return myPostList.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        let myPostList = appDelegate.myPostList
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! JobListTableViewCell
        // Configure the cell...
        
        cell.publisher.text = myPostList[indexPath.row].publisher
        cell.title.text = myPostList[indexPath.row].title
        cell.details.text = myPostList[indexPath.row].details
        cell.rewards.text = myPostList[indexPath.row].rewards
        return cell
        
    }
    
    
    func setGradientBackground() {
        let colorTop =  UIColor.black.cgColor
        let colorBottom = UIColor.black.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x:1.0,y: 1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y: 0.0)
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
      

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



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
