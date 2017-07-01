//
//  HomePageTableViewController.swift
//  Errandzon
//
//  Created by RTC14 on 2017/6/14.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit

class HomePageTableViewController: UITableViewController {
    
//     lazy var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        
        
        
   //     setGradientBackground()
//        searchBars.placeholder = "Search for tags or keywords..."
////        var leftNavBarButton = UIBarButtonItem(customView: searchBars)
//        var navBarTitle = UIBarButtonItem(customView: searchBars)
//        
//        self.navigationItem.titleView = navBarTitle
//        
//        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
//        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        setupMenuBar()
//        view.backgroundColor = UIColor.blue

    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addContraintsWithFormat("H:|[v0]|",views:menuBar)
        view.addContraintsWithFormat("V:|[v0(50)]",views:menuBar)
       
        
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 24.0/255.0, green: 237.0/255.0, blue: 234.0/255.0, alpha: 100.0).cgColor
        let colorBottom = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 100.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x:1.0,y: 1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y: 0.0)
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func createSearchBar(){
        let searchBar:UISearchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search for tags or keywords"
//        searchBar.delegate = self as! UISearchBarDelegate
        
        self.navigationItem.titleView = searchBar
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
        return appDelegate.errands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HomePageTableViewCell
        let errands = appDelegate.errands
        
        cell.publisher.text = errands[indexPath.row].publisher
        cell.title.text = errands[indexPath.row].title
        cell.details.text = errands[indexPath.row].details
        cell.rewards.text = errands[indexPath.row].rewards
        
        
        
        
        return cell
    }
    

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

