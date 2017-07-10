//
//  SettingTableViewController.swift
//  Errandzon
//
//  Created by RTC13 on 2017/6/22.
//  Copyright © 2017年 Revolutionaries. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class SettingTableViewController: UITableViewController {
    @IBAction func unwindToHomeScreen4(segue:UIStoryboardSegue) {
    }
    @IBOutlet var editTag: UILabel!
    
     @IBOutlet weak var facebookLogInButton: FBSDKLoginButton!
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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FBSDKLoginManager().logOut()
    }
    
    
    @IBAction func facebookLogOut(_ sender: UIButton) {
        let confirmationButton = (Any).self
        FBSDKLoginManager().logOut()
        print("you are loggin out")
        print(FBSDKAccessToken.current())
        showAlertButton(confirmationButton)
        
    }
    
    func showAlertButton(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "Log out", message: "If you want to change the other \n USER ACCOUNT \n You can enter the new facebook account later \n OR ... If you want to log out \n then BYE BYE ", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "LOG OUT", style: UIAlertActionStyle.destructive, handler: relogin))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func relogin(alert: UIAlertAction!) {
        self.performSegue(withIdentifier: "relogin", sender: self)
    }

    
}
